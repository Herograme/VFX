local Players = game:GetService("Players")
local RunService = game:GetService("RunService")





local PowerEffect = {

    ["Blue"] = function(Hitbox,Player)
        local AttachCenter = Instance.new("Attachment",Hitbox)
        local HitboxExist =  true 
        
				
        Hitbox.Touched:Connect(function(Hit)
            
            if Hit.parent:FindFirstChild("Humanoid") then
                local player = Players:GetPlayerFromCharacter(Hit.parent)  

                if Player == player then return end

                local Attachment = Instance.new("Attachment",Hit.parent.HumanoidRootPart)
                local LinearVelocity = Instance.new("LinearVelocity", Attachment)
                LinearVelocity.Attachment0 = Attachment
                LinearVelocity.MaxForce = math.huge
                       
            
                task.spawn(function()
                    while HitboxExist == true do
                        LinearVelocity.VectorVelocity = CFrame.lookAt(Attachment.WorldCFrame.Position, AttachCenter.WorldCFrame.Position).LookVector * 90
                        task.wait(0.5)
                    end
                end)
                

                Hitbox.Destroying:Connect(function()
                    Attachment:Destroy()
                    LinearVelocity:Destroy()
                    HitboxExist = false
                end)

            end
            

        end)

	    
    end

    



}



return PowerEffect