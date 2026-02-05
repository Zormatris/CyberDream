--[[
	QuestService
	Per-player active quest list
	- Add/remove/update quests
	- Send updates to client QuestUIController
]]

local ReplicatedStorage = game:GetService("ReplicatedStorage")

local QuestService = {}
QuestService.Name = "QuestService"

-- Per-player active quests: [player] = { questId1, questId2, ... }
local playerQuests = {}

function QuestService.Init()
	print("[QuestService] Initializing...")
end

function QuestService.OnPlayerAdded(player)
	playerQuests[player] = {}
	print("[QuestService] Initialized quests for", player.Name)
end

function QuestService.OnPlayerRemoving(player)
	playerQuests[player] = nil
end

-- Add quest (stub)
function QuestService.AddQuest(player, questId)
	if not playerQuests[player] then
		warn("[QuestService] No quest table for player:", player.Name)
		return
	end

	table.insert(playerQuests[player], questId)
	print("[QuestService]", player.Name, "quest added:", questId)

	-- Notify client (stub)
	local questCommand = ReplicatedStorage.Remotes:FindFirstChild("QuestCommand")
	if questCommand then
		questCommand:FireClient(player, {
			action = "Add",
			questId = questId
		})
	end
end

-- Remove quest (stub)
function QuestService.RemoveQuest(player, questId)
	if not playerQuests[player] then
		return
	end

	for i, qId in ipairs(playerQuests[player]) do
		if qId == questId then
			table.remove(playerQuests[player], i)
			print("[QuestService]", player.Name, "quest removed:", questId)
			break
		end
	end

	-- Notify client (stub)
	local questCommand = ReplicatedStorage.Remotes:FindFirstChild("QuestCommand")
	if questCommand then
		questCommand:FireClient(player, {
			action = "Remove",
			questId = questId
		})
	end
end

return QuestService