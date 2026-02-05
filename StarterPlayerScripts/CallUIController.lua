--[[
	CallUIController
	Call UI (bottom-left)
	- Typewriter messages
	- F to advance
	- Max 2 messages visible
]]

local CallUIController = {}

function CallUIController.Init(remotesTable, uisTable)
	print("[CallUIController] Initialized")
	-- Future: implement call message feed
end

function CallUIController.OnCallCommand(payload)
	print("[CallUIController] Received CallCommand:", payload)
	-- Future: start/end call, show messages
end

return CallUIController