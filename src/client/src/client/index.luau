local client = {}
local StudioPresence = script:FindFirstAncestor("StudioPresence")

local ActivityCreator = require(StudioPresence.src.generators.activityCreator)
local Data = require(StudioPresence.src.dataHandler)

function client.new(Http, _debug, plugin)
	local self = setmetatable({ Http = Http, _debug = _debug, plugin = plugin }, { __index = client })
	return self
end

function client:Close()
	self.Enabled = false
	self.Http:Post({
		updateType = "CLOSE",
	})
end

function client:SetActivity()
	return self.Http:Post({
		updateType = "SET_ACTIVITY",
		activity = ActivityCreator:Get(self.plugin),
	})
end

function client:Open()
	self.Enabled = true
	return self:SetActivity()
end

function client:login(cb)
	local enabled = Data:Get("Enabled")
	
	local success, reply
	if enabled or enabled == nil then
		success, reply = self:Open()
	else
		success = false
	end
	
	task.spawn(function()
		repeat
			if self.Enabled then
				local success, previousActivity = self:SetActivity()
				if success then
					script.Parent.Parent.httpClient:SetAttribute("previous", previousActivity)
				end
			end
			
			if self.Terminated then
				break
			end
			
			task.wait(1)
		until false
	end)
	
	if cb then
		cb(success, reply)
	end
	
	self.plugin.Unloading:Connect(function()
		self:Close()
	end)
end

return client
