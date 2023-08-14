local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Debris = game:GetService("Debris")

local PowerSystem = ReplicatedStorage:WaitForChild("PowerSystem")
local PowerModels = PowerSystem.Powers
local MovimentType = require(PowerSystem.MovimentTypes)

local PowerMoviment = {
	["Blue"] = function(Hitbox)

		local BlueSummon = PowerModels.BlueLapse:Clone()
		local WeldConstraint = Instance.new("WeldConstraint", Hitbox) -- takeshi continua chato ate com virgula
		
		BlueSummon:PivotTo(Hitbox.CFrame)
		WeldConstraint.Part0 = Hitbox
		WeldConstraint.Part1 = BlueSummon

		Debris:AddItem(BlueSummon, 6)
		
		BlueSummon.Parent = workspace.PowerSpawned

	end,

	["Red"] = function(Hitbox)
				
		local RedSummon = PowerModels.RedReversive:Clone()
		local WeldConstraint = Instance.new("WeldConstraint", Hitbox) -- takeshi continua chato ate com virgula
		
		RedSummon:PivotTo(Hitbox.CFrame)
		WeldConstraint.Part0 = Hitbox
		WeldConstraint.Part1 = RedSummon

		Debris:AddItem(RedSummon, 6)
		
		RedSummon.Parent = workspace.PowerSpawned


	end,
	["Purple"] = function(Hitbox)
		local PurpleSummon = PowerModels.RedReversive:Clone()
		local WeldConstraint = Instance.new("WeldConstraint", Hitbox) -- takeshi continua chato ate com virgula
		
		PurpleSummon:PivotTo(Hitbox.CFrame)
		WeldConstraint.Part0 = Hitbox
		WeldConstraint.Part1 = PurpleSummon

		Debris:AddItem(PurpleSummon, 6)
		
		PurpleSummon.Parent = workspace.PowerSpawned
	
	end
	

}
--[[PowerMoviment.__index = {}
 function PowerMoviment.new()
	local self = setmetatable(PowerMoviment,{})
	return self
 end

 function PowerMoviment:Create(SkillName)
	self.SkillName = SkillName

 end	
 function PowerMoviment:GetSkillName()
	return self.SkillName
 end]]
return PowerMoviment