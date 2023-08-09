local ReplicatedStorage = game:GetService("ReplicatedStorage")
--local Remotes = ReplicatedStorage.
local debris = game:GetService("Debris")
local PowerLocation = ReplicatedStorage.PowerSystem.Powers
local MovimentType = require(ReplicatedStorage.PowerSystem.MovimentTypes)











local PowerMoviment = {
	Blue = function(Player,cf,Direction)
		
		if   Player.Character and Player.Character.PrimaryPart then
		
			print("Spawnou Blue")
			
			--teste
			
			local BlueSummon = PowerLocation.BlueLapse:Clone() do
				debris:AddItem(BlueSummon,6)
				
				MovimentType.linear(BlueSummon,cf,Direction,50)
				
				BlueSummon.CFrame =  cf
				BlueSummon.Name ="Blue_"..Player.Name
				BlueSummon.Parent = workspace.PowerSpawned
				
				
			end
			
			task.wait(2)
			
			
		end
		
		
	end,

	Red = function()
		
	end



}





















return PowerMoviment