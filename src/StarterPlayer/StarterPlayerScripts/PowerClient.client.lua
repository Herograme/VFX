local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local remotes =  ReplicatedStorage.PowerSystem.Remotes
local Player = Players.LocalPlayer
local PowerData = require(ReplicatedStorage.PowerSystem.PowerMoviment)
local Inputs = require(ReplicatedStorage.PowerSystem.Inputs)




local function SpawnPower(SkillName,Origin,Direction)

   if not SkillName then 
      return
   end

   PowerData.PowerMoviment[SkillName](Player,Origin,Direction)

end




remotes.SummonPower.OnClientEvent:Connect(function(SkillName,Origin,Direction)
    local PlayerRootPart = Player.Character:FindFirstChild("HumanoidRootPart")

    print(PlayerRootPart)
    
    if not PlayerRootPart then
      return
    end
   
    print("Eu tenho a força")
    local PlayerPosition =  PlayerRootPart.Position
    local magntude = (Origin.Position - PlayerPosition).Magnitude
    local Studs  = math.floor(magntude)
     if Studs <= 400 then
        SpawnPower(SkillName,Origin,Direction)
     end



end)



