local ContextActionService = game:GetService("ContextActionService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

local Player = Players.LocalPlayer
local Remote = ReplicatedStorage.PowerSystem.Remotes
local Mouse = player:GetMouse()

local Debounce = {}

function CheckInputBegin(InputState)
    
    if InputState == Enum.UserInputState.Begin then
        return true
    end

end

function FireSkill(SkillType, InputState)
   
    local InputBegin = CheckInputBegin(InputState)

    if not Debounce[SkillType] and InputBegin then

       -- local Origin = player.Character.RightHand.RightGripAttachment.WorldCFrame
       -- origin vai para o servidor para evitar burlas

        local Direction = Mouse.Hit.Position

        Debounce[SkillType] = true
        remote.SummonPower:FireServer(SkillType, Direction)

        task.wait(3)
        Debounce[SkillType] = nil

    end
        
end

ContextActionService:BindAction("Skill_E", FireSkill, false, Enum.KeyCode.E)
ContextActionService:BindAction("Skill_Q", FireSkill, false, Enum.KeyCode.Q)
ContextActionService:BindAction("Skill_R", FireSkill, false, Enum.KeyCode.R)
ContextActionService:BindAction("Block", FireSkill, false, Enum.KeyCode.F)










return Inputs 
