--[[
	FlagService
	Per-player flag management
	- Stores boolean/string/number flags
	- Gates dialogue/cutscenes/triggers
]]

local FlagService = {}
FlagService.Name = "FlagService"

-- Per-player flags: [player][flagKey] = value
local playerFlags = {}

function FlagService.Init()
	print("[FlagService] Initializing...")
end

function FlagService.OnPlayerAdded(player)
	playerFlags[player] = {}
	print("[FlagService] Initialized flags for", player.Name)
end

function FlagService.OnPlayerRemoving(player)
	playerFlags[player] = nil
end

-- Set flag
function FlagService.SetFlag(player, key, value)
	if not playerFlags[player] then
		warn("[FlagService] No flag table for player:", player.Name)
		return
	end
	playerFlags[player][key] = value
	print("[FlagService]", player.Name, "flag set:", key, "=", value)
end

-- Get flag
function FlagService.GetFlag(player, key)
	if not playerFlags[player] then
		return nil
	end
	return playerFlags[player][key]
end

-- Check flag equals value
function FlagService.FlagEquals(player, key, value)
	local currentValue = FlagService.GetFlag(player, key)
	return currentValue == value
end

return FlagService