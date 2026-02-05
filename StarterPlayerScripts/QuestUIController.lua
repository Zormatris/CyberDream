--[[
	QuestUIController
	Quest UI display (top-left)
	- Stack quests
	- Show/hide based on state
]]

local QuestUIController = {}

function QuestUIController.Init(remotesTable, uisTable)
	print("[QuestUIController] Initialized")
	-- Future: manage quest UI stack
end

function QuestUIController.OnQuestCommand(payload)
	print("[QuestUIController] Received QuestCommand:", payload)
	-- Future: add/remove/update quest UI
end

return QuestUIController