--[[
	CallService
	Per-player call playback state
	- Start/end calls
	- Track current message index
]]

local ReplicatedStorage = game:GetService("ReplicatedStorage")

local CallService = {}
CallService.Name = "CallService"

-- Per-player call state: [player] = { callId, currentIndex }
local playerCalls = {}

function CallService.Init()
	print("[CallService] Initializing...")
end

function CallService.OnPlayerAdded(player)
	playerCalls[player] = nil
	print("[CallService] Initialized call state for", player.Name)
end

function CallService.OnPlayerRemoving(player)
	playerCalls[player] = nil
end

-- Start call (stub)
function CallService.StartCall(player, callId)
	playerCalls[player] = {
		callId = callId,
		currentIndex = 1
	}
	print("[CallService]", player.Name, "call started:", callId)

	-- Notify client (stub)
	local callCommand = ReplicatedStorage.Remotes:FindFirstChild("CallCommand")
	if callCommand then
		callCommand:FireClient(player, {
			action = "Start",
			callId = callId
		})
	end
end

-- End call (stub)
function CallService.EndCall(player)
	if playerCalls[player] then
		print("[CallService]", player.Name, "call ended:", playerCalls[player].callId)
		playerCalls[player] = nil

		-- Notify client (stub)
		local callCommand = ReplicatedStorage.Remotes:FindFirstChild("CallCommand")
		if callCommand then
			callCommand:FireClient(player, {
				action = "End"
			})
		end
	end
end

return CallService