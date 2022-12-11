local activityCreator = {}

local StudioPresence = script:FindFirstAncestor("StudioPresence")

local Activity = require(StudioPresence.src.activity).new()
local FormatString = require(StudioPresence.src.generators.formatString)
local Data = require(StudioPresence.src.dataHandler)
local StudioService = game:GetService("StudioService")

function eval(item)
	if item == "" then
		return false
	end
	if item == nil then
		return false
	end
	if item == false then
		return false
	end
	if item == 0 then
		return false
	end
	if pcall(function()
		return #item
	end) and #item == 0 then
		return false
	end
	return true
end

function activityCreator:Get()
	local savedDescription = Data:Get("Description")
	local savedState = Data:Get("State")

	local active = StudioService.ActiveScript
	local editing = "StudioPresence by iArxic"
	local description = "Developing"
	if active ~= nil then
		description = "Editing " .. active.Name .. " (" .. #string.split(active.source, "\n") .. " lines)"
	end
	if active == nil then
		active = "studio"
	elseif active:IsA("ModuleScript") then
		editing = "Editing a MODULE Script"
		active = "modulescript"
	elseif active:IsA("LocalScript") then
		editing = "Editing a CLIENT Script"
		active = "clientscript"
	elseif active:IsA("Script") then
		editing = "Editing a SERVER Script"
		active = "serverscript"
	end

	Activity:clear()
		:setDescription(description)
		:setState(FormatString:process("Workspace: $WORKSPACE"))
		:setImage(active, editing)
		:setTimer()

	return Activity
end

return activityCreator
