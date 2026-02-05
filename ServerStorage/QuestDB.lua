--[[
	QuestDB
	Quest definitions by questId
	Format:
	{
		[questId] = {
			title = "Find Amy",
			text = "Look for Amy in the city",
			stackGroup = nil (optional),
			onStartEffects = { ... },
			onCompleteEffects = { ... }
		}
	}
]]

local QuestDB = {
	-- Example stub entry
	["quest_01"] = {
		title = "Find Amy",
		text = "Look for Amy in the city",
		stackGroup = nil,
		onStartEffects = {},
		onCompleteEffects = {}
	}
}

return QuestDB