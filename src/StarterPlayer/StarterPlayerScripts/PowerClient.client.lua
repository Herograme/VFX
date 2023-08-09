local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")


local PowerSystem = ReplicatedStorage:WaitForChild("PowerSystem")
local PowerData = require(PowerSystem.PowerMoviment)
local Inputs = require(PowerSystem.Inputs)
local Remotes =  PowerSystem.Remotes
local Player = Players.LocalPlayer

function SpawnPower(SkillName, Hitbox)

   local SkillFunction = PowerData[SkillName]

   if not SkillFunction then return end

   SkillFunction(Hitbox)

end

function LoadSkill(SkillName, Hitbox)

   local Character = Player.Character
   local HumanoidRootPart = Character and Character:FindFirstChild("HumanoidRootPart")

   if not HumanoidRootPart then return end
  
   local RootPartPosition =  HumanoidRootPart.Position
   local Magnitude = (Hitbox.Position - RootPartPosition).Magnitude

    if Magnitude < 400 then
       SpawnPower(SkillName, Hitbox)
    end

end

Remotes.SummonPower.OnClientEvent:Connect(LoadSkill)


--[[local constructor = PowerData.new()
print(constructor:GetSkillName())
constructor:Create("TESTE")
print(constructor:GetSkillName())
print(PowerData)
local constructor2 = PowerData.new()]]