SAMURAI = SAMURAI or { }
local sam = SAMURAI

local tracking = false
local kills = 0

local function unregisterSpawnAlert()
	sam.EM:UnregisterForEvent(sam.name.."LyTurSpawnAlert", EVENT_COMBAT_EVENT)
	tracking = false
end

local function spawnAlert(eventCode, result, isError, abilityName, abilityGraphic, abilityActionSlotType, sourceName, sourceType, targetName, targetType, hitValue, powerType, damageType, log, sourceUnitId, targetUnitId, abilityId)
	if not tracking then return end
	local cur1, max1 = GetUnitPower("boss1", POWERTYPE_HEALTH)
	local cur2, max2 = GetUnitPower("boss2", POWERTYPE_HEALTH)
	if cur1 < max1 or cur2 < max2 then
		unregisterSpawnAlert()
	end
	if targetType == 0 then
		sam.debug("unit died, source: %s, target: %s, hitValue: %d", tostring(sourceType), tostring(targetType), hitValue)
		kills = kills + 1
	end
	if kills >= 6 then
		unregisterSpawnAlert()
		sam.spawnTimer(6.4)
	end
end

local function startSpawnAlert(_, inCombat)
	if tracking then
		unregisterSpawnAlert()
	end
	if not inCombat then return end
	local boss1 = zo_strformat("<<1>>", GetUnitName('boss1'))
	local boss2 = zo_strformat("<<1>>", GetUnitName('boss2'))
	if not (boss1 == "Lylanar" and boss2 == "Turlassil") then return end
	kills = 0
	tracking = true
	sam.EM:RegisterForEvent(sam.name.."LyTurSpawnAlert", EVENT_COMBAT_EVENT, spawnAlert)
	sam.EM:AddFilterForEvent(sam.name.."LyTurSpawnAlert", EVENT_COMBAT_EVENT, REGISTER_FILTER_COMBAT_RESULT, ACTION_RESULT_DIED)
end

local function onUnload()
	unregisterSpawnAlert()
	kills = 0
end

local function onLoad()
	sam.EM:RegisterForEvent(sam.name.."LyTurSpawnAlert", EVENT_PLAYER_COMBAT_STATE, startSpawnAlert)
end

local dsr = sam.Instance:New(1344, nil, nil, onLoad, onUnload)
--dsr:AddAlert(sam.TimerNotification:New("ShockingNumblingShards", "ff3333", "|cbbbbffTurlassil|r Interput (|cff3333Fire Aura|r)", EVENT_COMBAT_EVENT, ACTION_RESULT_BEGIN, {166735}, false))
--dsr:AddAlert(sam.TimerNotification:New("ShockingCinderSurge", "bbbbff", "|cff3333Lylanar|r Interput (|cbbbbffIce Aura|r)", EVENT_COMBAT_EVENT, ACTION_RESULT_BEGIN, {166693}, false))
--dsr:AddAlert(sam.ActiveNotification:New(nil, nil, "CreeperCringe", "bbbbff", EVENT_COMBAT_EVENT, ACTION_RESULT_BEGIN, {174565}, "Cringe!", 2000, true))
table.insert(sam.instances, dsr)
