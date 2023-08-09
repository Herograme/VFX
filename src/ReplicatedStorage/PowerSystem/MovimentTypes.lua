local MovimentType = {
    
	linear = function(Object, Origin, Direction, Velocity)

		local Attach = Instance.new("Attachment", Object)
		local LinearVelocity = Instance.new("LinearVelocity", Object)
	
		LinearVelocity.MaxForce = math.huge
		LinearVelocity.VectorVelocity = CFrame.lookAt(Origin.Position, Direction).LookVector * Velocity		
		LinearVelocity.Attachment0 =  Attach		
	
	 end,
	
	 Arc = function(Object, Origin, Direction, Velocity)
		
	
	
	 end
	
}
   



















return MovimentType