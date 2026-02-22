local httpClient = {}
local HTTP = game:GetService("HttpService")

local scriptParent = script.Parent

function httpClient.new(url)
	local self = setmetatable({ URL = url }, { __index = httpClient })
	return self
end

function httpClient:Post(requestBody)
	local success, reply = pcall(function()
		if requestBody.updateType ~= "CLOSE" then
			if script:GetAttribute("previous") and script:GetAttribute("previous") == requestBody.activity.details then
				return "Repeated"
			end -- please dont ask, i got weird bugs with different solutions to this therefore this is the ultimate solution for now!
		end
		return HTTP:PostAsync(self.URL, HTTP:JSONEncode(requestBody))
	end)
	if not success then
		if scriptParent.Parent:FindFirstChild("index") then
			local AttributeValue = scriptParent.Parent.index:GetAttribute("Disabled")

			if AttributeValue == nil or AttributeValue == false then
				scriptParent.Parent.index:SetAttribute("Disabled", true)
			end

			scriptParent.Parent.index:SetAttribute("Disabled", false)
		end
	end

	if success and requestBody.updateType~="CLOSE" then
		reply = requestBody.activity.details
	end
	return success, reply
end

return httpClient
