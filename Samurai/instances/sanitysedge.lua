SAMURAI = SAMURAI or { }
local sam = SAMURAI

local function onUnload()
	local key = sam.name.."ChimeraSpawnAlert"
	EVENT_MANAGER:UnregisterForEvent(key, EVENT_DISPLAY_ANNOUNCEMENT)
end

local function onLoad()
	local key = sam.name.."ChimeraSpawnAlert"
	EVENT_MANAGER:RegisterForEvent(key, EVENT_DISPLAY_ANNOUNCEMENT, function(_, title, description)
		if title == "Gryphon asterism aligned. Control sequence complete." then
			SAMURAI.spawnTimer(7.9)
		end
	end)
end

local se = sam.Instance:New(1427, nil, nil, onLoad, onUnload)
table.insert(sam.instances, se)
