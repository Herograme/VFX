local InputService = game:GetService("ContextActionService")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local player = Players.LocalPlayer
local remote = ReplicatedStorage.PowerSystem.Remotes
local Mouse = player:GetMouse()



local function PowerCheck(Skill)
    local debouce = false
        if Skill ~= nil and debouce == false then
            local Origin = player.Character.RightHand.RightGripAttachment.WorldCframe
            local Direction = Mouse.Hit.Position


            debouce = true
            remote.SummonPower:FireServer(Skill,Origin,Direction)
        end
        task.wait(3)
        debouce = false
end


local Inputs = {
	
    ["E"]= function()
        
        local Skill = player:GetAttribute("Skill_E")
        PowerCheck(Skill)
    end,
	["Q"]= function()
        local Skill = player:GetAttribute("Skill_Q")
        PowerCheck(Skill)        
    end,
	["R"]= function()
        local Skill = player:GetAttribute("Skill_R")
        PowerCheck(Skill)        
    end,
	["F"]= function()
        
        PowerCheck("Block")        
    end,
	
	
}








InputService:BindAction("Skill_E",Inputs.E,false,Enum.KeyCode.E)
--InputService:SetTitle("TESTE","Só clica")
InputService:BindAction("Skill_Q",Inputs.Q,false,Enum.KeyCode.Q)
InputService:BindAction("Skill_R",Inputs.R,false,Enum.KeyCode.R)
InputService:BindAction("Skill_F",Inputs.F,false,Enum.KeyCode.F)










return Inputs 
