local InputService = game:GetService("ContextActionService")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local player = Players.LocalPlayer
local remote = ReplicatedStorage.PowerSystem.Remotes
local Mouse = player:GetMouse()


local debouce = {}
local function CheckButtonState(InputState)
    
    if InputState == Enum.UserInputState.Begin then
        return true
    end
end

local function PowerCheck(Skill,InputState)
   
    if not Skill then
        return warn("Locked Skill")
    end

    local CheckInputState = CheckButtonState(InputState)
        if not debouce[Skill] and CheckInputState == true then
            local Origin = player.Character.RightHand.RightGripAttachment.WorldCFrame
            local Direction = Mouse.Hit.Position


            debouce[Skill] = true
            remote.SummonPower:FireServer(Skill,Origin,Direction)
            task.wait(3)
            debouce[Skill] = nil
        end
        
end





local Inputs = {
	
    ["E"]= function(ActionName,InputState,InputObject)
        
        local Skill = player:GetAttribute("Skill_E")
      
        PowerCheck(Skill,InputState)   

    end,
	["Q"]= function(ActionName,InputState,InputObject)
        local Skill = player:GetAttribute("Skill_Q")
      
        PowerCheck(Skill,InputState)         
    end,
	["R"]= function(ActionName,InputState,InputObject)
        local Skill = player:GetAttribute("Skill_R")
      
        PowerCheck(Skill,InputState)        
    end,
	["F"]= function(ActionName,InputState,InputObject)
       
        PowerCheck("Block",InputState)        
    end,
	
	
}








InputService:BindAction("Skill_E",Inputs.E,false,Enum.KeyCode.E)
--InputService:SetTitle("TESTE","Só clica")
InputService:BindAction("Skill_Q",Inputs.Q,false,Enum.KeyCode.Q)
InputService:BindAction("Skill_R",Inputs.R,false,Enum.KeyCode.R)
InputService:BindAction("Skill_F",Inputs.F,false,Enum.KeyCode.F)










return Inputs 
