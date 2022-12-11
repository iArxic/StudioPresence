local httpClient = {};
local HTTP = game:GetService("HttpService");

function httpClient.new(url)
	local self = setmetatable({ URL = url }, { __index = httpClient });
	return self;
end;

function httpClient:Post(requestBody)
	local success, reply = pcall(function()
		return HTTP:PostAsync(self.URL, HTTP:JSONEncode(requestBody));
	end);
	
	if not success then
		script.Parent.Parent.index.Disabled=true
		script.Parent.Parent.index.Disabled=false
	end;
	
	return success, reply;
end;

return httpClient;
