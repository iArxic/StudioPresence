--[[

This script is by Papgy100, I've added the menu, with the options for custom plugin support
Currentlly, I only made with plugin support for stuff like Moon Animator 2 with the option to add custom plugin support...

--]]

local GUI = script.Parent.index:WaitForChild("GUI")
local PluginTemplate = script:WaitForChild("Template")

local function ShowPlugins()
	local currentSettings = plugin:GetSetting("StudioPresence") or {}
	
	for index, Plugin in ipairs(currentSettings) do
		local PluginTemp = PluginTemplate:Clone()
		PluginTemp.Name = Plugin.PluginName
		PluginTemp.Title.Text = Plugin.PluginName
		PluginTemp.Parent = GUI.Container.Plugins.Container
		
		PluginTemp.Delete.MouseButton1Click:Connect(function()
			table.remove(currentSettings, index)
			plugin:SetSetting("StudioPresence", currentSettings)
			
			PluginTemp:Destroy()
			print("✅ Successfully deleted plugin: " .. Plugin.PluginName)
		end)
	end
end

GUI.Container.Plugins.Container.AddCustom.Add.MouseButton1Click:Connect(function()
	local succ, err = pcall(function()
		local PluginName = GUI.Container.Plugins.Container.AddCustom.PluginName.Text
		local Output = GUI.Container.Plugins.Container.AddCustom.Output.Text
		local OutputLocation = GUI.Container.Plugins.Container.AddCustom.OutputLocation.Text
		local Description = GUI.Container.Plugins.Container.AddCustom.Description.Text
		
		if PluginName == "" or Output == "" or OutputLocation == "" or Description == "" then
			warn("❌ Cannot add plugin: one or more fields are empty.")
			return
		end
		
		local currentSettings = plugin:GetSetting("StudioPresence") or {}
		
		local newPlugin = {
			PluginName = PluginName,
			PluginOutput = Output,
			PluginOutputLocation = OutputLocation,
			PluginDescription = Description,
		}
		
		table.insert(currentSettings, newPlugin)
		
		plugin:SetSetting("StudioPresence", currentSettings)
		
		print("✅ Successfully added a new custom plugin: " .. PluginName)
		ShowPlugins()
	end)
	if not succ then
		warn("❌ Error while adding a new custom plugin: " .. err)
	end
end)

ShowPlugins()
