--[[
	CutsceneController
	Cutscene playback
	- Execute timeline beats
	- Report finished to server
]]

local CutsceneController = {}

function CutsceneController.Init(remotesTable, uisTable)
	print("[CutsceneController] Initialized")
	-- Future: implement cutscene timeline execution
end

function CutsceneController.OnCutsceneCommand(payload)
	print("[CutsceneController] Received CutsceneCommand:", payload)
	-- Future: play cutscene, fire CutsceneFinished
end

return CutsceneController