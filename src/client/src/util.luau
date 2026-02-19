local util = {}

-- Get place (Used for name later)
local success, place = pcall(function()
	return game:GetService("MarketplaceService"):GetProductInfoAsync(game.PlaceId)
end)

-- If offline, above fetch will have failed, remedy that by just getting the game.
if not success then
	place = game
end

util.place = place

function util.getPlaceName()
	return util.place.Name
end

-- Guard: Only run in Studio edit mode, not during playtesting
local RunService = game:GetService("RunService")
if not RunService:IsStudio() or RunService:IsRunning() then
	return util
end

local lastEdit = tick()
local lastScript = game:GetService("StudioService").ActiveScript
local lastLen = 0
function util.hasChanges()
	local s = game:GetService("StudioService").ActiveScript

	if s then
		local len = #s.Source:split("\n")

		if s ~= lastScript or lastLen ~= len then
			lastLen = len
			lastScript = s
			lastEdit = tick()
		end

		if tick() - lastEdit > 180 then
			-- changes = false
		else
			-- changes = true
		end
	end

	return true
end

return util
