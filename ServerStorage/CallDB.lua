--[[
	CallDB
	Call message sequences by callId
	Format:
	{
		[callId] = {
			messages = {
				{ speaker = "Caller", text = "Hey, it's me." },
				{ speaker = "Player", text = "What's up?" },
				...
			}
		}
	}
]]

local CallDB = {
	-- Example stub entry
	["call_01"] = {
		messages = {
			{ speaker = "Caller", text = "This is a placeholder call message." }
		}
	}
}

return CallDB