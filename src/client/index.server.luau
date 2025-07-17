-- CREDITS TO RIGID STUDIOS FOR MAKING THIS OPEN SOURCED!! THIS ISNT MY ORIGINAL SCRIPT, JUST HEAVILY EDITED!

local toolbar = plugin:CreateToolbar("StudioPresence")
local button = toolbar:CreateButton("Toggle StudioPresence panel", "StudioPresence with a menu", "rbxassetid://137140153706497")

script.Parent.src.activity:SetAttribute("started", os.time())
local started = false

local function start()
	local StudioPresence = script:FindFirstAncestor("StudioPresence")
	local env = {
		["plugin"] = plugin,
	}
	
	for i, v in ipairs(StudioPresence:GetDescendants()) do
		if not v:IsA("ModuleScript") then continue end
		local m = require(v)
		setmetatable(m, { __index = env })
	end
	
	local Data = require(StudioPresence.src.dataHandler)
	local Client = require(StudioPresence.src.client.index)
	
	local Http = require(StudioPresence.src.httpClient).new("http://localhost:4455/")
	local ClientObj = Client.new(Http, false, plugin)
	
	Data:AttachChange("Enabled", function(isEnabled)
		if isEnabled then
			ClientObj:Open()
		else
			ClientObj:Close()
		end
	end)
	
	plugin.Unloading:Connect(function()
		ClientObj.Enabled = false
		ClientObj.Terminated = true
	end)
	
	ClientObj:login(function(success)
		if success then
			started = true
		else
			task.wait(3)
			start()
			ClientObj.Enabled = false
		end
	end)
end

if not started then
	start()
end

local widgetInfo = DockWidgetPluginGuiInfo.new(
	Enum.InitialDockState.Float,
	true,
	false,
	400,
	300,
	300,
	200
)

local widget = plugin:CreateDockWidgetPluginGui("MyCustomDockWidget", widgetInfo)
widget.Title = "Studio Presence"

local GUI = script:WaitForChild("GUI")
GUI.Parent = widget

button.Click:Connect(function()
	widget.Enabled = not widget.Enabled
	if widget.Enabled == true then
		GUI.Visible = true
	else
		GUI.Visible = false
	end
end)

