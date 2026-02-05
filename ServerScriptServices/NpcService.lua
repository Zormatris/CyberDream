--[[
	NpcService
	Register NPC rigs by attributes
	- Apply collision rules (Dialogue: full collision, Walker: world only, Cutscene: none)
	- Attach/configure ProximityPrompts for Dialogue NPCs
	
	NPC Attribute Conventions:
	- NpcId (string): unique identifier
	- NpcType (string): "Dialogue" | "Walker" | "Cutscene"
	- DialogueId (string, optional): dialogue graph to use
	- WalkerRouteId (string, optional): route to follow
]]

local NpcService = {}
NpcService.Name = "NpcService"

function NpcService.Init()
	print("[NpcService] Initializing...")
	-- Future: scan Workspace.NPCs folder and register rigs
end

function NpcService.OnPlayerAdded(player)
	-- No per-player init needed yet
end

function NpcService.OnPlayerRemoving(player)
	-- No cleanup needed yet
end

-- Register an NPC rig (stub)
function NpcService.RegisterNpc(npcRig)
	local npcId = npcRig:GetAttribute("NpcId")
	local npcType = npcRig:GetAttribute("NpcType")

	if not npcId or not npcType then
		warn("[NpcService] NPC missing required attributes:", npcRig:GetFullName())
		return
	end

	print("[NpcService] Registered NPC:", npcId, "Type:", npcType)

	-- Future: apply collision groups, attach prompts, etc.
end

return NpcService