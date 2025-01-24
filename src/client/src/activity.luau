local activity = {}
local startTick = os.time()

function activity.new()
	return setmetatable({ assets = {} }, { __index = activity })
end

function activity:clear()
	self.buttons = nil
	self.timestamps = nil

	return self
end

function activity:addButton(buttonName, buttonValue)
	if buttonName and buttonValue and buttonName ~= "" and buttonValue ~= "" then
		if not self.buttons then
			self.buttons = {}
		end

		-- TODO?: Surplus buttons check.
		self.buttons[#self.buttons + 1] = { label = buttonName, url = buttonValue }
	end

	return self
end

function activity:setDescription(detailsValue)
	self.details = detailsValue

	return self
end

function activity:setState(stateValue)
	self.state = stateValue

	return self
end

function activity:setTimer()
	if not self.timestamps then
		self.timestamps = {}
	end
	self.timestamps = {
		start = script:GetAttribute("started"),
	}

	return self
end

function activity:setImage(imageName, text)
	if not self.assets then
		self.assets = {}
	end

	self.assets.large_image = imageName
	self.assets.large_text = text
	return self
end

function activity:setThumbnail(imageName, text)
	if not self.assets then
		self.assets = {}
	end

	self.assets.small_image = imageName
	self.assets.small_image_key = text

	return self
end

return activity
