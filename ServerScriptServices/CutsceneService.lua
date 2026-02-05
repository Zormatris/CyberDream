--[[
	CutsceneService
	Server boundary for cutscenes
	- Start cutscene and wait for client to finish
	- Set completion flags
]]

local ReplicatedStorage = game:GetService("ReplicatedStorage")

local CutsceneService = {}
CutsceneService.Name = "CutsceneService"

function CutsceneService.Init()
	print("[CutsceneService] Initializing...")

	-- Hook CutsceneFinished remote (stub)
	local cutsceneFinished = ReplicatedStorage.Remotes:FindFirstChild("CutsceneFinished")
	if cutsceneFinished then
		cutsceneFinished.OnServerEvent:Connect(function(player, cutsceneId)
			print("[CutsceneService]", player.Name, "finished cutscene:", cutsceneId)
			-- Future: set flag, restore state, etc.
		end)
	end
end

function CutsceneService.OnPlayerAdded(player)
	-- No per-player init needed yet
end

function CutsceneService.OnPlayerRemoving(player)
	-- No cleanup needed yet
end

-- Start cutscene (stub)
function CutsceneService.StartCutscene(player, cutsceneId)
	print("[CutsceneService]", player.Name, "starting cutscene:", cutsceneId)

	-- Notify client (stub)
	local cutsceneCommand = ReplicatedStorage.Remotes:FindFirstChild("CutsceneCommand")
	if cutsceneCommand then
		cutsceneCommand:FireClient(player, {
			action = "Start",
			cutsceneId = cutsceneId
		})
	end
end

return CutsceneService