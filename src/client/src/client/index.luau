local client = {}
local StudioPresence = script:FindFirstAncestor("StudioPresence")

local ActivityCreator = require(StudioPresence.src.generators.activityCreator)
local Data = require(StudioPresence.src.dataHandler)

function client.new(Http, _debug)
	local self = setmetatable({ Http = Http, _debug = _debug }, { __index = client })

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
		activity = ActivityCreator:Get(),
	})
end

function client:Open()
	self.Enabled = true
	return self:SetActivity()
end

-- Initiate with cb -> callback(success<bool>, response<string>);
function client:login(cb)
	local enabled = Data:Get("Enabled")

	local success, reply
	if enabled or enabled == nil then
		success, reply = self:Open()
	else
		success = false
	end

	spawn(function()
		while 1 do
			wait(2.6) -- Accuracy un-necessary.

			if self.Enabled then
				self:SetActivity()
			end

			if self.Terminated then
				break
			end
		end
	end)

	if cb then
		cb(success, reply)
	end

	self.plugin.Unloading:Connect(function()
		self:Close()
	end)
end

return client
