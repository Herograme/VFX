local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Remotes = ReplicatedStorage.Poderes
local debris = game:GetService("Debris")













PowerMoviment = {






}
















Remotes.SummonPower.OnServerEvent:Connect(function(Player,Direction,cf)
    local db = {}
	if not table.find(db  , Player) and Player.Character and Player.Character.PrimaryPart then
	table.insert(db,Player)
		local Torso = Player.Character:FindFirstChild("Torso") or Player.Character.PrimaryPart
		
		--teste
		
		local BlueSummon = ReplicatedStorage.Poderes.Blue:Clone() do
			debris:AddItem(BlueSummon,6)
			
			--[[local VectorForce = Instance.new("VectorForce")
			local Attach = Instance.new("Attachment", BlueSummon)
			VectorForce.Attachment0 =  Attach
			VectorForce.RelativeTo= Enum.ActuatorRelativeTo.World
			VectorForce.Force = CFrame.lookAt(position.Position, Direction).LookVector * 100
			VectorForce.Parent = BlueSummon]]
			local Attach = Instance.new("Attachment", BlueSummon)
			
			local LinearVelocity = Instance.new("LinearVelocity", BlueSummon)
			LinearVelocity.MaxForce = math.huge
			LinearVelocity.VectorVelocity = CFrame.lookAt(cf.Position, Direction).LookVector * 50		
			LinearVelocity.Attachment0 =  Attach
			
			
			BlueSummon.CFrame =  cf
			BlueSummon.Parent = workspace
			
			
		end
		
		task.wait(2)
		
		table.remove(db, table.find(db,Player))
	end
end)






return PowerMoviment