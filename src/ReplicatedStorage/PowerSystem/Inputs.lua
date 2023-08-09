local ContextActionService = game:GetService("ContextActionService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

local player = Players.LocalPlayer
local remote = ReplicatedStorage.PowerSystem.Remotes
local Mouse = player:GetMouse()

local Debounce = {}
local Animations = {
    Blue = "rbxassetid://14377106664"
} 

function CheckInputBegin(InputState)
    
    if InputState == Enum.UserInputState.Begin then
        return true
    end

end

function FireSkill(SkillType, InputState)
   
    local InputBegin = CheckInputBegin(InputState)
    local SkillName = player:GetAttribute(SkillType)
    if not Debounce[SkillType] and InputBegin and SkillName then

       -- local Origin = player.Character.RightHand.RightGripAttachment.WorldCFrame
       -- origin vai para o servidor para evitar burlas

        local Direction = Mouse.Hit.Position
        local Animator = player.Character.Humanoid.Animator
        local Animation = Instance.new("Animation")
        Animation.AnimationId = Animations[SkillName] or "rbxassetid://1"
        local AnimationTrack = Animator:LoadAnimation(Animation)
        AnimationTrack:Play()

        --print(SkillType)
        Debounce[SkillType] = true
       
        AnimationTrack:GetMarkerReachedSignal("SummonPower"):Connect(function(Arguments)
            if Arguments == "Laucher" then
                remote.SummonPower:FireServer(SkillType, Direction)
            end
        end)
        

        task.wait(3)
        Debounce[SkillType] = nil

    end
        
end

ContextActionService:BindAction("Skill_E", FireSkill, false, Enum.KeyCode.E)
ContextActionService:BindAction("Skill_Q", FireSkill, false, Enum.KeyCode.Q)
ContextActionService:BindAction("Skill_R", FireSkill, false, Enum.KeyCode.R)
ContextActionService:BindAction("Block", FireSkill, false, Enum.KeyCode.F)










return Inputs 
