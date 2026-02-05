--[[
	TriggerDB
	Trigger definitions by triggerId (optional - can use part attributes only)
	Format:
	{
		[triggerId] = {
			action = "StartDialogue:amy_intro",
			conditions = { ... },
			once = true
		}
	}
]]

local TriggerDB = {
	-- Example stub entry
	["alley_enter"] = {
		action = "StartDialogue:amy_intro",
		conditions = {},
		once = true
	}
}

return TriggerDB