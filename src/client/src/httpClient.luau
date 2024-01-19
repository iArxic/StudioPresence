local httpClient = {}
local HTTP = game:GetService("HttpService")

function httpClient.new(url)
	local self = setmetatable({ URL = url }, { __index = httpClient })
	return self
end


function httpClient:Post(requestBody)
	local success, reply = pcall(function()
		if requestBody.updateType~="CLOSE" then
			if script:GetAttribute("previous") and script:GetAttribute("previous")==requestBody.activity.details then return "Repeated" end -- please dont ask, i got weird bugs with different solutions to this therefore this is the ultimate solution for now!
		end
		return HTTP:PostAsync(self.URL, HTTP:JSONEncode(requestBody))
	end)
	if not success then
		script.Parent.Parent.index.Disabled = true
		script.Parent.Parent.index.Disabled = false
	end

	if success then reply=requestBody.activity.details end
	return success, reply
end

return httpClient
