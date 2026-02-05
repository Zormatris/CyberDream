--[[
	TransitionController
	Transition handshake pipeline
	- Fade out -> ack (TransitionOnBlack) -> server commits -> fade in
]]

local TransitionController = {}

local remotes

function TransitionController.Init(remotesTable, uisTable)
	remotes = remotesTable
	print("[TransitionController] Initialized")
	-- Future: implement handshake
end

return TransitionController