--[[
	StateController
	Manages client-side state and applies ModeProfiles
	- Receives StateChanged from server
	- Coordinates with other controllers to apply state rules
]]

local StateController = {}

local remotes
local uis
local currentState = "FreeRoam"

function StateController.Init(remotesTable, uisTable)
	remotes = remotesTable
	uis = uisTable
	print("[StateController] Initialized")
end

function StateController.OnStateChanged(payload)
	local newState = payload.newState
	local statePayload = payload.payload or {}

	print("[StateController] State changed:", currentState, "->", newState)
	currentState = newState

	-- Future: apply ModeProfiles here
	-- For now, just log
	if newState == "FreeRoam" then
		print("[StateController] Entering FreeRoam mode")
	elseif newState == "Dialogue" then
		print("[StateController] Entering Dialogue mode")
	elseif newState == "Cutscene" then
		print("[StateController] Entering Cutscene mode")
	end
end

function StateController.GetCurrentState()
	return currentState
end

return StateController