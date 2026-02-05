--[[
	DialogueController
	Dialogue presentation
	- Hero cam snap
	- Dialogue UI choreography
	- Choice handling
]]

local DialogueController = {}

function DialogueController.Init(remotesTable, uisTable)
	print("[DialogueController] Initialized")
	-- Future: implement dialogue UI animations
end

function DialogueController.OnDialogueCommand(payload)
	print("[DialogueController] Received DialogueCommand:", payload)
	-- Future: show dialogue UI, process node
end

return DialogueController