--[[
	StoryService
	Master orchestrator for story state machine
	- Owns per-player state (FreeRoam/Dialogue/Cutscene/UIOnly/Frozen/QTE)
	- Only service allowed to change state
	- Coordinates with other services for state transitions
]]

local ReplicatedStorage = game:GetService("ReplicatedStorage")

local StoryService = {}
StoryService.Name = "StoryService"

-- State enums
StoryService.States = {
	FreeRoam = "FreeRoam",
	Dialogue = "Dialogue",
	Cutscene = "Cutscene",
	UIOnly = "UIOnly",
	Frozen = "Frozen",
	QTE = "QTE",
}

-- Per-player state tracking
local playerStates = {} -- [player] = currentState

function StoryService.Init()
	print("[StoryService] Initializing...")
	-- Future: hook remotes here
end

function StoryService.OnPlayerAdded(player)
	-- Initialize player to FreeRoam state
	playerStates[player] = StoryService.States.FreeRoam
	print("[StoryService] Player", player.Name, "initialized to FreeRoam")

	-- Send initial state to client
	local stateChanged = ReplicatedStorage.Remotes:FindFirstChild("StateChanged")
	if stateChanged then
		stateChanged:FireClient(player, {
			newState = StoryService.States.FreeRoam,
			payload = {}
		})
	end
end

function StoryService.OnPlayerRemoving(player)
	playerStates[player] = nil
	print("[StoryService] Cleaned up state for", player.Name)
end

-- Get current state for a player
function StoryService.GetState(player)
	return playerStates[player] or StoryService.States.FreeRoam
end

-- Set state (stub - will use transition handshake later)
function StoryService.SetState(player, newState, payload)
	if not StoryService.States[newState] then
		warn("[StoryService] Invalid state:", newState)
		return
	end

	local oldState = playerStates[player]
	playerStates[player] = newState
	print("[StoryService] State change:", player.Name, oldState, "->", newState)

	-- Notify client (stub - will use transition pipeline later)
	local stateChanged = ReplicatedStorage.Remotes:FindFirstChild("StateChanged")
	if stateChanged then
		stateChanged:FireClient(player, {
			newState = newState,
			payload = payload or {}
		})
	end
end

return StoryService