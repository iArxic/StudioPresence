local activityCreator = {}

local StudioPresence = script:FindFirstAncestor("StudioPresence")

local Activity = require(StudioPresence.src.activity).new()
local FormatString = require(StudioPresence.src.generators.formatString)

function activityCreator:Get()
	local StudioService = game:GetService("StudioService")
	local ScriptEditorService = game:GetService("ScriptEditorService")
	local RunService = game:GetService("RunService")

	local activeScript = StudioService.ActiveScript
	local description = "Developing"
	local editing = "StudioPresence by iArxic"
	local imageKey = "studio"
	local smallImageKey, smallImageDesc = "", ""
	local lineText

	if activeScript then
		local doc = ScriptEditorService:FindScriptDocument(activeScript)

		if doc then
			local sLine, _sChar, _eLine, _eChar = doc:GetSelection()
			local cursorLine = sLine or 1
			lineText = doc:GetLine(cursorLine) or ""
			lineText = lineText:gsub("^%s+", "")
			lineText = lineText:sub(1, 120)

			local lineCount = doc:GetLineCount()

			description = string.format("%s — %d / %d", activeScript.Name, cursorLine, lineCount)
		else
			-- Fallback to editor/source line count if document isn't open
			local text = ScriptEditorService:GetEditorSource(activeScript) or activeScript.Source or ""
			local lines = #string.split(text, "\n")
			description = string.format("%s (%d lines)", activeScript.Name, lines)
		end

		-- script type -> image/label (kept from your cleaned version)
		if workspace.Camera:FindFirstChild("MoonAnimator2MouseFilter") then
			editing = "Moon Animator 2"
			description = "Animating"
			imageKey = "MoonAnimator"
		elseif activeScript:IsA("ModuleScript") then
			editing = "Editing a MODULE Script"
			imageKey = "modulescript"
		elseif activeScript:IsA("LocalScript") then
			editing = "Editing a CLIENT Script"
			imageKey = "clientscript"
		elseif activeScript:IsA("Script") then
			if activeScript.RunContext ~= Enum.RunContext.Client then
				editing = "Editing a SERVER Script"
				imageKey = "serverscript"
			else
				editing = "Editing a CLIENT Script"
				imageKey = "clientscript"
			end
		end
	end

	if RunService:IsRunning() then
		editing = "StudioPresence by iArxic"
		description = "Testing"
		imageKey = "studio"
		smallImageKey = "playtesticon"
		smallImageDesc = "Testing"
	end

	Activity:clear()
		:setDescription(description)
		:setState(FormatString:process("└ $WORKSPACE"))
		:setImage(imageKey, editing)
		:setTimer()

	if RunService:IsRunning() then
		Activity:setThumbnail(smallImageKey, smallImageDesc)
	end

	return Activity
end

return activityCreator
