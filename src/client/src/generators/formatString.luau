local formatString = {}
local StudioPresence = script:FindFirstAncestor("StudioPresence")

local Util = require(StudioPresence.src.util)
local StudioService = game:GetService("StudioService")

local Variables = {
	["%$SCRIPT_NAME"] = {
		Description = "Name of the current script",
		Obtain = function(src)
			if not src then
				return
			end
			return src.Name
		end,
	},
	["%$SCRIPT_LINES"] = {
		Description = "Line count of the current script",
		Obtain = function(src)
			if not src then
				return
			end
			return #src.Source:split("\n")
		end,
	},
	["%$SCRIPT_PARENT"] = {
		Description = "Name of the current script's parent",
		Obtain = function(src)
			if not src then
				return
			end
			return src.Parent.Name
		end,
	},
	["%$WORKSPACE"] = {
		Description = "Name of the current place",
		Obtain = function(src)
			return Util.getPlaceName()
		end,
	},
	["%$PLACE_ID"] = {
		Description = "ID of the current place",
		Obtain = function(src)
			return Util.place.PlaceId or "0"
		end,
	},
	["%$PLACE_PUBLISHED:<>:<>"] = {
		Description = "If published, first setting, if not, second setting.",
		Obtain = function(src, publicStr, notPublicStr)
			-- IsA: member of Instance (only usable when place was set to current game instead of placeInfo.
			return formatString:process(Util.place.IsA and notPublicStr or publicStr)
		end,
	},
	["%$ACTIVITY:<>"] = {
		Decription = "Away (No Script open), Idle (No Changes recently, <follow> (Editing)",
		Obtain = function(src, following)
			return Util.hasChanges() and formatString:process(following or "Editing $SCRIPT_NAME ($SCRIPT_LINES lines)")
				or "Developing.."
		end,
	},
}

function formatString:process(str)
	for identifier, value in pairs(Variables) do
		str = str:gsub(string.gsub(identifier, "<>", "(.*)"), function(...)
			return value.Obtain(StudioService.ActiveScript, ...)
		end)
	end

	return str
end

return formatString
