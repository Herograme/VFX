local MovimentType = {
    
 linear = function(Item ,Origin,Direction, Velocity )
        print("Movimento")
		local Attach = Instance.new("Attachment", Item)
		local LinearVelocity = Instance.new("LinearVelocity", Item)
		LinearVelocity.MaxForce = math.huge
		LinearVelocity.VectorVelocity = CFrame.lookAt(Origin.Position, Direction).LookVector * Velocity		
		LinearVelocity.Attachment0 =  Attach		
 end,
 Arc = function()
    
 end
}
   



















return MovimentType