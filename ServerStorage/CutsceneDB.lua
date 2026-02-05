--[[
	CutsceneDB
	Cutscene timelines by cutsceneId
	Format:
	{
		[cutsceneId] = {
			beats = {
				{ type = "CameraTo", marker = "Marker1" },
				{ type = "Wait", duration = 2.0 },
				{ type = "NpcAnim", npcId = "amy_01", animId = "..." },
				{ type = "SetFlag", key = "cutscene_seen", value = true },
				{ type = "End" }
			}
		}
	}
]]

local CutsceneDB = {
	-- Example stub entry
	["cut_01"] = {
		beats = {
			{ type = "Wait", duration = 1.0 },
			{ type = "End" }
		}
	}
}

return CutsceneDB