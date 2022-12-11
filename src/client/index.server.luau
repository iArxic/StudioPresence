-- CREDITS TO RIGID STUDIOS FOR MAKING THIS OPEN SOURCED!! THIS ISNT MY ORIGINAL SCRIPT, JUST HEAVILY EDITED!

script.Parent.src.activity:SetAttribute("started",os.time())
local started=false

local function start()
	local StudioPresence = script:FindFirstAncestor("StudioPresence");
	local env = {
		["plugin"] = plugin
	}

	for i,v in ipairs(StudioPresence:GetDescendants()) do
		if v:IsA("ModuleScript") then
			local m = require(v)
			setmetatable(m,{__index = env})
		end
	end

	local Data   = require(StudioPresence.src.dataHandler);
	local Client = require(StudioPresence.src.client.index);

	local Http      = require(StudioPresence.src.httpClient).new("http://localhost:4455/");
	local ClientObj = Client.new(Http, false);

	Data:AttachChange("Enabled", function(isEnabled)
		if isEnabled then ClientObj:Open() else ClientObj:Close() end;
	end)

	plugin.Unloading:Connect(function()
		ClientObj.Enabled = false;
		ClientObj.Terminated = true;
	end);

	ClientObj:login(function(success)
		if success then
			started=true
		else
			wait(3)
			start()
			ClientObj.Enabled = false;
		end;
	end);
end

if started==false then
	start()
end