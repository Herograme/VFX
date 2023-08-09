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

	["Red"] = function()
		
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