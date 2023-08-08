local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local remotes =  ReplicatedStorage.PowerSystem.Remotes
local Player = Players.LocalPlayer





local function SpawnPower()
    
end




remotes.SummonPower.OnClientEvent:Connect(function(SkillName,Origin,Direction)
    local PlayerPosition = Player.HumanoidRootPart.CFrame
    local magntude = (Origin - PlayerPosition).Magnitude
    local Studs  = math.floor(magntude)
     if Studs <= 400 then
        SpawnPower()
     end



end)