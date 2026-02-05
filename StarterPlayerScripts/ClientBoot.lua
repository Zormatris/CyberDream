--[[
	ClientBoot
	Main client initialization script
	- Waits for Remotes
	- Initializes controllers in proper order
	- Wires remote listeners
]]

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local StarterGui = game:GetService("StarterGui")
local Players = game:GetService("Players")

local player = Players.LocalPlayer

print("[ClientBoot] Starting client initialization...")

-- STEP 1: Wait for Remotes folder
local remotesFolder = ReplicatedStorage:WaitForChild("Remotes", 10)
if not remotesFolder then
	warn("[ClientBoot] Remotes folder not found! Aborting.")
	return
end

print("[ClientBoot] Remotes folder found")

-- STEP 2: Collect remotes
local remotes = {
	StateChanged = remotesFolder:WaitForChild("StateChanged"),
	StoryCommand = remotesFolder:WaitForChild("StoryCommand"),
	TransitionOnBlack = remotesFolder:WaitForChild("TransitionOnBlack"),
	DebugCycleState = remotesFolder:WaitForChild("DebugCycleState"),
	DialogueCommand = remotesFolder:WaitForChild("DialogueCommand"),
	DialogueChoice = remotesFolder:WaitForChild("DialogueChoice"),
	DialogueContinue = remotesFolder:WaitForChild("DialogueContinue"),
	CutsceneCommand = remotesFolder:WaitForChild("CutsceneCommand"),
	CutsceneFinished = remotesFolder:WaitForChild("CutsceneFinished"),
	QuestCommand = remotesFolder:WaitForChild("QuestCommand"),
	CallCommand = remotesFolder:WaitForChild("CallCommand"),
	CallAdvance = remotesFolder:WaitForChild("CallAdvance"),
}

print("[ClientBoot] All remotes loaded")

-- STEP 3: Collect UI references
local uis = {
	FadeGui = StarterGui:WaitForChild("FadeGui"),
	DialogueGui = StarterGui:WaitForChild("DialogueGui"),
	ContinueGui = StarterGui:WaitForChild("ContinueGui"),
	QuestGui = StarterGui:WaitForChild("QuestGui"),
	CallGui = StarterGui:WaitForChild("CallGui"),
}

print("[ClientBoot] All UI references loaded")

-- STEP 4: Require controllers
local controllersFolder = script.Parent:WaitForChild("Controllers")

local StateController = require(controllersFolder:WaitForChild("StateController"))
local InputController = require(controllersFolder:WaitForChild("InputController"))
local CameraController = require(controllersFolder:WaitForChild("CameraController"))
local PlayerController = require(controllersFolder:WaitForChild("PlayerController"))
local UIController = require(controllersFolder:WaitForChild("UIController"))
local AudioController = require(controllersFolder:WaitForChild("AudioController"))
local FadeController = require(controllersFolder:WaitForChild("FadeController"))
local TransitionController = require(controllersFolder:WaitForChild("TransitionController"))
local ContinueController = require(controllersFolder:WaitForChild("ContinueController"))
local DialogueController = require(controllersFolder:WaitForChild("DialogueController"))
local CutsceneController = require(controllersFolder:WaitForChild("CutsceneController"))
local QuestUIController = require(controllersFolder:WaitForChild("QuestUIController"))
local CallUIController = require(controllersFolder:WaitForChild("CallUIController"))

print("[ClientBoot] All controllers loaded")

-- STEP 5: Initialize controllers in proper order
StateController.Init(remotes, uis)
InputController.Init(remotes, uis)
CameraController.Init(remotes, uis)
PlayerController.Init(remotes, uis)
UIController.Init(remotes, uis)
AudioController.Init(remotes, uis)
FadeController.Init(remotes, uis)
TransitionController.Init(remotes, uis)
ContinueController.Init(remotes, uis)
DialogueController.Init(remotes, uis)
CutsceneController.Init(remotes, uis)
QuestUIController.Init(remotes, uis)
CallUIController.Init(remotes, uis)

print("[ClientBoot] All controllers initialized")

-- STEP 6: Wire remote listeners
remotes.StateChanged.OnClientEvent:Connect(function(payload)
	StateController.OnStateChanged(payload)
end)

remotes.StoryCommand.OnClientEvent:Connect(function(payload)
	print("[ClientBoot] Received StoryCommand:", payload)
	-- Future: route to TransitionController or StateController
end)

remotes.DialogueCommand.OnClientEvent:Connect(function(payload)
	DialogueController.OnDialogueCommand(payload)
end)

remotes.CutsceneCommand.OnClientEvent:Connect(function(payload)
	CutsceneController.OnCutsceneCommand(payload)
end)

remotes.QuestCommand.OnClientEvent:Connect(function(payload)
	QuestUIController.OnQuestCommand(payload)
end)

remotes.CallCommand.OnClientEvent:Connect(function(payload)
	CallUIController.OnCallCommand(payload)
end)

print("[ClientBoot] Client initialization complete!")