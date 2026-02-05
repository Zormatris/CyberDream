--[[
	DialogueDB
	Dialogue graphs by dialogueId
	Format:
	{
		[dialogueId] = {
			entryNode = "node_01",
			nodes = {
				[nodeId] = {
					speaker = "Amy" | "Player",
					line = "...",
					heroCam = "HeroCam1" (optional),
					delayBeforeChoices = 1.5,
					choices = { ... } (optional),
					autoNext = "node_id" (optional),
					effects = { ... } (optional),
					conditions = { ... } (optional)
				}
			}
		}
	}
]]

local DialogueDB = {
	-- Example stub entry
	["amy_intro"] = {
		entryNode = "node_01",
		nodes = {
			["node_01"] = {
				speaker = "Amy",
				line = "Hello! This is a placeholder dialogue line.",
				delayBeforeChoices = 1.5,
				choices = nil,
				autoNext = nil
			}
		}
	}
}

return DialogueDB