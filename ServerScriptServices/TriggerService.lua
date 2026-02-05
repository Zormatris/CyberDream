--[[
	TriggerService
	Validate and fire world triggers
	- Check conditions (flags, quests)
	- Execute actions (start dialogue/cutscene, set flags, etc.)
	- Handle "Once" triggers
	
	Trigger Part Attribute Conventions:
	- TriggerId (string): unique identifier
	- Once (bool): fire only once per player
	- OnEnterAction (string): action to execute (e.g., "StartDialogue:amy_intro")
	- DisableIfFlag (string, optional): flag condition to disable trigger
]]

local TriggerService = {}
TriggerService.Name = "TriggerService"

function TriggerService.Init()
	print("[TriggerService] Initializing...")
	-- Future: scan Workspace.Triggers folder and hook Touched events
end

function TriggerService.OnPlayerAdded(player)
	-- No per-player init needed yet
end

function TriggerService.OnPlayerRemoving(player)
	-- No cleanup needed yet
end

-- Register a trigger part (stub)
function TriggerService.RegisterTrigger(triggerPart)
	local triggerId = triggerPart:GetAttribute("TriggerId")

	if not triggerId then
		warn("[TriggerService] Trigger missing TriggerId:", triggerPart:GetFullName())
		return
	end

	print("[TriggerService] Registered trigger:", triggerId)

	-- Future: hook Touched, validate conditions, fire actions
end

return TriggerService