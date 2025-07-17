local activityCreator = {}

local StudioPresence = script:FindFirstAncestor("StudioPresence")

local Activity = require(StudioPresence.src.activity).new()
local FormatString = require(StudioPresence.src.generators.formatString)
local Data = require(StudioPresence.src.dataHandler)
local StudioService = game:GetService("StudioService")

function eval(item)
	if item == "" then return false end
	if item == nil then return false end
	if item == false then return false end
	if item == 0 then return false end
	if pcall(function() return #item end) and #item == 0 then return false end
	return true
end

function activityCreator:Get(plugin)
	
	local active = StudioService.ActiveScript
	local state = nil
	local editing = "StudioPresence by iArxic"
	local description = "Developing"
	local smallImageKey, smallImageDesc = "",""
	if active~=nil then
		description = "Editing "..active.Name.." ("..#string.split(active.Source,"\n").." lines)"
	end
	if active==nil then
		active = "studio"
	elseif active:IsA("ModuleScript") then
		editing = "Editing a MODULE Script"
		active="modulescript"
	elseif active:IsA("LocalScript") then
		editing="Editing a CLIENT Script"
		active="clientscript"
	elseif active:IsA("Script") then
		if active.RunContext~=Enum.RunContext.Client then
			editing="Editing a SERVER Script"
			active="serverscript"
		else
			editing="Editing a CLIENT Script"
			active="clientscript"
		end
	end
	
	if game:GetService("RunService"):IsRunning() then
		editing="StudioPresence by iArxic"
		active="studio"
		description="Testing"
		smallImageKey="playtesticon"
		smallImageDesc = "Testing"
	end
	
	local pluginSettings = plugin:GetSetting("StudioPresence") or {}
	for _, savedPlugin in ipairs(pluginSettings) do
		local parent
		if savedPlugin.PluginOutputLocation == "Workspace" then
			parent = workspace
		elseif savedPlugin.PluginOutputLocation == "Camera" then
			parent = workspace.CurrentCamera
		elseif savedPlugin.PluginOutputLocation == "ReplicatedStorage" then
			parent = game:GetService("ReplicatedStorage")
		elseif savedPlugin.PluginOutputLocation == "StarterGui" then
			parent = game:GetService("StarterGui")
		elseif savedPlugin.PluginOutputLocation == "StarterPack" then
			parent = game:GetService("StarterPack")
		elseif savedPlugin.PluginOutputLocation == "StarterPlayer" then
			parent = game:GetService("StarterPlayer")
		elseif savedPlugin.PluginOutputLocation == "ServerStorage" then
			parent = game:GetService("ServerStorage")
		elseif savedPlugin.PluginOutputLocation == "ServerScriptService" then
			parent = game:GetService("ServerScriptService")
		elseif savedPlugin.PluginOutputLocation == "Lighting" then
			parent = game:GetService("Lighting")
		elseif savedPlugin.PluginOutputLocation == "Players" then
			parent = game:GetService("Players")
		elseif savedPlugin.PluginOutputLocation == "Teams" then
			parent = game:GetService("Teams")
		elseif savedPlugin.PluginOutputLocation == "SoundService" then
			parent = game:GetService("SoundService")
		elseif savedPlugin.PluginOutputLocation == "Chat" then
			parent = game:GetService("Chat")
		elseif savedPlugin.PluginOutputLocation == "TestService" then
			parent = game:GetService("TestService")
		elseif savedPlugin.PluginOutputLocation == "HttpService" then
			parent = game:GetService("HttpService")
		elseif savedPlugin.PluginOutputLocation == "RunService" then
			parent = game:GetService("RunService")
		elseif savedPlugin.PluginOutputLocation == "LocalizationService" then
			parent = game:GetService("LocalizationService")
		else
			parent = workspace
		end
		
		if parent:FindFirstChild(savedPlugin.PluginOutput) then
			editing = savedPlugin.PluginName
			active = "studio"
			description = savedPlugin.PluginDescription
			smallImageKey = "debug"
			smallImageDesc = "Debugging"
			state = true
			break
		end
	end
	Activity
		:clear()
		:setDescription(description)
		:setState(FormatString:process("Workspace: $WORKSPACE"))
		:setImage(active,editing)
		:setTimer()
	if game:GetService("RunService"):IsRunning() or state == true then
		Activity:setThumbnail(smallImageKey,smallImageDesc)
	end
	return Activity
end

return activityCreator
