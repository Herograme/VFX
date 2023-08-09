local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Debris = game:GetService("Debris")

local PowerSystem = ReplicatedStorage:WaitForChild("PowerSystem")
local PowerModels = PowerSystem.Powers
local MovimentType = require(PowerSystem.MovimentTypes)

local PowerMoviment = {
	["Blue"] = function(Origin, Direction)

		local BlueSummon = PowerModels.BlueLapse:Clone()

		Debris:AddItem(BlueSummon, 6)
			
		MovimentType.linear(BlueSummon, Origin, Direction, 50)
		
		BlueSummon:PivotTo(Origin)
		BlueSummon.Parent = workspace.PowerSpawned

	end,

	["Red"] = function()
		
	end



}

return PowerMoviment