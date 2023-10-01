SAMURAI = SAMURAI or { }
local sam = SAMURAI

sam.name = "Samurai"
sam.version = "2.14.0-beta"

sam.EM = EventCallbackManager and EventCallbackManager:New("SamuraiManager") or GetEventManager()
local EM = sam.EM

sam.dbug = false

sam.LUNITS = LibUnits2

sam.defaults = {
	["debug"] = false,
	["26bReset"] = false,
	["bossTimers"] = true,
	["hideSubtitles"] = GetSetting(SETTING_TYPE_SUBTITLES, SUBTITLE_SETTING_ENABLED) == 0, -- legacy
	["activeOffsetX"] = 0,
	["activeOffsetY"] = -150,
	["activePoint"] = CENTER,
	["activeRelPoint"] = CENTER,
	["timedOffsetX"] = 0,
	["timedOffsetY"] = -120,
	["timedPoint"] = TOP,
	["timedRelPoint"] = CENTER,
	["modules"] = {
		["potions"] = {
			["renameHeroism"] = true,
			["renameTri"] = true,
			["renameVitality"] = true,
		},
		["targetHealth"] = {
			["show"] = false,
		},
	},
	["notis"] = {
		["Dive"] = true,
		["TakingAim"] = true,
		["HeavyAttack"] = true,
		["HeavySlash"] = true,
		["Bash"] = true,
		["UpperCut"] = true,
		["AnvilCracker"] = true,
		["CrushingBlow"] = true,
		["Boulder"] = true,
		["Slam"] = true,
		["powerBash"] = true,
		["LavaWhip"] = true,
		["TopplingBlow"] = true,
		["ClashofBones"] = true,
		["DrainResource"] = true,
		["LavaGeyser"] = true,
		["Rake"] = true, 
		["WrathofTides"] = true, 
		["CrashingWave"] = true, 
		["Chaurus"] = false, 
		["ChaurusInc"] = false, 
		["StoneCurse"] = true, 
		["ShockingSmash"] = true,
		["DirectCurrent"] = true,
		["NocturnalsFavor"] = true,
		["Creeper"] = true,
		["HeavyStrike"] = true,
		["ssNegate"] = true,
		["ssGale"] = true,
		["ssIce"] = true,
		["transApoc"] = true,
		["asBossProtected"] = true,
		["ShockLash"] = false,
		["IcyTeleport"] = false,
		["creeperTarget"] = false,
		["creeperStun"] = false,
		--["kaMeteor"] = true, go away kabs
	},
}

sam.instances = { }

function sam.debug(message, ...)
	if not sam.dbug then return end
	df("[|cffd000Samur|r.|cffe675ai|r] %s", message:format(...))
end

local function slash(args)
	if args == "debug 1" then
		sam.dbug = true
		sam.savedVars.debug = true
		sam.debug("|c00FF00enabling|r debug mode")
	elseif args == "debug 0" then
		sam.debug("|cFF0000disabling|r debug mode")
		sam.dbug = false
		sam.savedVars.debug = false
	elseif args == "master" then
		sam.masterPrint()
	end
end

function sam.playerActivated()
	local zoneID = GetZoneId(GetUnitZoneIndex("player"))
	for k,v in pairs(sam.instances) do
		if v:getZoneID() == zoneID then
			sam.debug("loading zone %d", zoneID)
			v:Register()
		else
			v:Unregister()
		end
	end
end

function sam.fireInstanceCombatHandlers(e, inCombat)
	for k,v in pairs(sam.instances) do
		if v:getIsLoaded() then
			if inCombat then
				sam.debug("starting")
				v:StartCombat()
			else
				sam.debug("resetting")
				v:Reset()
			end
		end
	end
end

sam.lineTable = {
	["There! Somethings coming through! Another fabricant!"] = 7.2, -- 586
	["Reprocessing yard contamination critical"] = 9.3, -- 586
	["Aha! There's its cogitation array, in the distance%. Keep the body distracted while I unravel its mind"] = 7, -- 586
	["Attack the secondary terminals!"] = 33, -- 586
	["It's bypassing my alterations! Disrupt the secondary terminals now!"] = 33, -- 586
	["The secondary terminals are attempting to compensate! Give them a whack!"] = 33, -- 586
	["Don't .... It's ... trap%."] = 15.6, -- mol
    ["Non... C'est... un piège%."] = 15.6, -- mol
	["Have you not heard me%? Have I not"] = 24.4, -- mol
    ["Vous ne m'avez pas entendu"] = 24.4, -- mol
	["The Celestial Mage summons me to"] = 4.4,
	["To restore the natural order%. To reclaim all that was and will be"] = 21.2,
	["Feel that%? A chill breeze"] = 22.3,
	["we kept it hidden from our brethren and buried them with our tears"] = 11,
	["They shall not intrude much longer"] = 5,
--	["What've we got here%? An audience%?"] = 21, -- 904
	["Fresh challengers more like%."] = 16.8, -- 904
	["Let me show you the power that's going to crush that little flotilla of yours%."] = 15.7, -- 904
	["Who did this%? Where's At'avar%?"] = 12.6, -- 547
	["Boss, I don't think he's listening%."] = 14.2, -- 547
	["Ambush%. What a lovely idea%."] = 12.5, -- 547
	["And so the final challenge begins%. Those who would represent me as champion now stand in this arena, deep within my realm%. Only those who remain standing will receive my highest honor%."] = 41, -- dsa
--	["You know Hiath, so his presence here should come as no surprise%. Defeat him and become my new chosen%. Lose, and you will be lost and forgotten in the depths of my realm%."] = 19.6, -- dsa
	["By Sovngarde%. Let's just focus on bashing in some heads, yah?"] = 17.1, -- 547
	["Great Xalvakka drank deep from the souls we served her%. Soon, she arrives!"] = 7.7, -- rg
	["Damn! They're here sooner than expected"] = 14.4, -- fl
	["You're still here%? If you must admire my work, at least allow me to put my best fossil"] = 10.6, -- fl
	["Not to be an ungracious host"] = 19.9, -- fl
	["So many of the things you've broken I can easily replace"] = 16.8, -- fl
	["At last I can unveil the centerpiece of my collection"] = 17.9, -- fl
	["How dare you reject Lady Thorn's offer%? Look! Tremble before the power you might have wielded!"] = 9, -- ct
	["Well done, Talfyg%. You brought me a daughter of Verandis, as requested%. She will complement our lord's army well%."] = 19.2, -- ct
	["Where did he go%?"] = 8.5, -- mos
	["Why do you still hesitate, Vanton%?"] = 6.4, -- se
}

local function bossLines(text)
	if not sam.savedVars.bossTimers then return false end
	for searchString, time in pairs(sam.lineTable) do
		if string.find(text, searchString) then
			sam.spawnTimer(time)
		end
	end
end

local channels = {
	[CHAT_CHANNEL_MONSTER_EMOTE] = "CHAT_CHANNEL_MONSTER_EMOTE",
	[CHAT_CHANNEL_MONSTER_SAY] = "CHAT_CHANNEL_MONSTER_SAY",
	[CHAT_CHANNEL_MONSTER_WHISPER] = "CHAT_CHANNEL_MONSTER_WHISPER",
	[CHAT_CHANNEL_MONSTER_YELL] = "CHAT_CHANNEL_MONSTER_YELL",
}

local function chatHandler(e, channelType, fromName, text, isCustomerSupport, fromDisplayName)
	if channels[channelType] then
		sam.debug("message received in channel: %s containing text: %s", channels[channelType], tostring(text))
		bossLines(tostring(text))
	end
end

function sam.init(e, addon)
	if addon ~= sam.name then return end
	EM:UnregisterForEvent(sam.name.."Load", EVENT_ADD_ON_LOADED)
	sam.savedVars = ZO_SavedVars:NewCharacterIdSettings("SamuraiSavedVars", 1, "Samurai", sam.defaults, GetWorldName())
	sam.dbug = sam.savedVars.debug
	SLASH_COMMANDS["/samurai"] = slash
	sam.buildDisplay()
	sam.buildMenu()
	sam.setupTestHarness()
	sam.onStartupNotificationSetup()
	EM:RegisterForEvent(sam.name.."playerActivate", EVENT_PLAYER_ACTIVATED, sam.playerActivated)
	sam.generalAlerts:Register()

	EM:RegisterForEvent(sam.name.."ChatHandler", EVENT_CHAT_MESSAGE_CHANNEL, chatHandler)
	EM:RegisterForEvent(sam.name.."CombatHandlers", EVENT_PLAYER_COMBAT_STATE, sam.fireInstanceCombatHandlers)

	-- setup modules
	sam.setupPotionModule()
	sam.setupTargetHealthModule()

	-- old setting cleanup
	if sam.savedVars.bossTimers and sam.savedVars.hideSubtitles then
		sam.savedVars.hideSubtitles = false
		zo_callLater(function()
			SetSetting(SETTING_TYPE_SUBTITLES, SUBTITLE_SETTING_ENABLED, 0)
		end, 3000)
	end
	
	if not sam.savedVars["26bReset"] then
		sam.savedVars.bossTimers = true
		sam.savedVars["26bReset"] = true
	end
end

EM:RegisterForEvent(sam.name.."Load", EVENT_ADD_ON_LOADED, sam.init)

