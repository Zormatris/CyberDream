--[[
	FadeController
	Black screen fade in/out
	- Used by TransitionController
]]

local FadeController = {}

function FadeController.Init(remotesTable, uisTable)
	print("[FadeController] Initialized")
	-- Future: implement fade tweens
end

function FadeController.FadeOut(duration)
	print("[FadeController] Fade out:", duration)
	-- Future: tween black frame to visible
	task.wait(duration or 0.25)
end

function FadeController.FadeIn(duration)
	print("[FadeController] Fade in:", duration)
	-- Future: tween black frame to invisible
	task.wait(duration or 0.25)
end

return FadeController