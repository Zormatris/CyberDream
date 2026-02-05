--[[
	NPCDB
	NPC definitions by npcId
	Format:
	{
		[npcId] = {
			name = "Amy",
			defaultIdle = "rbxassetid://...",
			defaultWalk = "rbxassetid://...",
			promptText = "Talk",
			promptEnabled = true,
			heroCams = {"HeroCam1", "HeroCam2"},
			roleTag = "QuestGiver" -- optional
		}
	}
]]

local NPCDB = {
	-- Example stub entry
	["amy_01"] = {
		name = "Amy",
		defaultIdle = nil,
		defaultWalk = nil,
		promptText = "Talk",
		promptEnabled = true,
		heroCams = {"HeroCam1"},
		roleTag = "QuestGiver"
	}
}

return NPCDB