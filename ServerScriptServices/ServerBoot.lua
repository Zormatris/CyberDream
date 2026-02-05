--[[
	ServerBoot
	Main server initialization script
	- Creates all RemoteEvents
	- Initializes services in proper order
	- Hooks PlayerAdded/PlayerRemoving
]]

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerScriptService = game:GetService("ServerScriptService")
local Players = game:GetService("Players")

print("[ServerBoot] Starting server initialization...")

-- STEP 1: Ensure Remotes folder exists
local remotesFolder = ReplicatedStorage:FindFirstChild("Remotes")
if not remotesFolder then
	remotesFolder = Instance.new("Folder")
	remotesFolder.Name = "Remotes"
	remotesFolder.Parent = ReplicatedStorage
	print("[ServerBoot] Created Remotes folder")
end

-- STEP 2: Create all RemoteEvents (if they don't exist)
local remoteNames = {
	-- Core
	"StateChanged",
	"StoryCommand",
	"TransitionOnBlack",
	"DebugCycleState",
	-- Dialogue
	"DialogueCommand",
	"DialogueChoice",
	"DialogueContinue",
	-- Cutscene
	"CutsceneCommand",
	"CutsceneFinished",
	-- Quest
	"QuestCommand",
	-- Call
	"CallCommand",
	"CallAdvance",
}

for _, remoteName in ipairs(remoteNames) do
	if not remotesFolder:FindFirstChild(remoteName) then
		local remote = Instance.new("RemoteEvent")
		remote.Name = remoteName
		remote.Parent = remotesFolder
		print("[ServerBoot] Created RemoteEvent:", remoteName)
	end
end

print("[ServerBoot] All remotes verified")

-- STEP 3: Require services in safe order
local servicesFolder = ServerScriptService:WaitForChild("Services")

local StoryService = require(servicesFolder:WaitForChild("StoryService"))
local FlagService = require(servicesFolder:WaitForChild("FlagService"))
local QuestService = require(servicesFolder:WaitForChild("QuestService"))
local CallService = require(servicesFolder:WaitForChild("CallService"))
local CutsceneService = require(servicesFolder:WaitForChild("CutsceneService"))
local NpcService = require(servicesFolder:WaitForChild("NpcService"))
local TriggerService = require(servicesFolder:WaitForChild("TriggerService"))

-- STEP 4: Initialize services
local services = {
	StoryService,
	FlagService,
	QuestService,
	CallService,
	CutsceneService,
	NpcService,
	TriggerService,
}

for _, service in ipairs(services) do
	if service.Init then
		service.Init()
		print("[ServerBoot] Initialized:", service.Name or "Unknown Service")
	end
end

print("[ServerBoot] All services initialized")

-- STEP 5: Hook player lifecycle
Players.PlayerAdded:Connect(function(player)
	print("[ServerBoot] Player joined:", player.Name)
	for _, service in ipairs(services) do
		if service.OnPlayerAdded then
			task.spawn(function()
				service.OnPlayerAdded(player)
			end)
		end
	end
end)

Players.PlayerRemoving:Connect(function(player)
	print("[ServerBoot] Player leaving:", player.Name)
	for _, service in ipairs(services) do
		if service.OnPlayerRemoving then
			task.spawn(function()
				service.OnPlayerRemoving(player)
			end)
		end
	end
end)

print("[ServerBoot] Server initialization complete!")