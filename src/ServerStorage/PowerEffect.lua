local Players = game:GetService("Players")
local RunService = game:GetService("RunService")





local PowerEffect = {

    ["Blue"] = function(Hitbox,Player)
        local AttachCenter = Instance.new("Attachment",Hitbox)
        local HitboxExist =  true 
       local debounce = {}
				
        Hitbox.Touched:Connect(function(Hit)
        local Character = Hit.Parent   
            if Character:FindFirstChild("Humanoid") then
                local playerTarget = Players:GetPlayerFromCharacter(Character)  

                

                if debounce[Character] or Player == playerTarget then return end
                
                --[[local Attachment = Instance.new("Attachment",Character.HumanoidRootPart)
                local AllingPosition = Instance.new("AlignPosition",Character)
                AllingPosition.Attachment0 = AttachCenter
                AllingPosition.Attachment1 = Attachment
                AllingPosition.Responsiveness = 100]]



                local Attachment = Instance.new("Attachment",Character.HumanoidRootPart)
                local LinearVelocity = Instance.new("LinearVelocity", Attachment)
                LinearVelocity.Attachment0 = Attachment
                LinearVelocity.MaxForce = math.huge
                debounce[Character] = true       
            
               --[[local Heartbeat = RunService.Heartbeat:Connect(function()
                    task.wait(0.5)
                    LinearVelocity.VectorVelocity = CFrame.lookAt(Attachment.WorldCFrame.Position, AttachCenter.WorldCFrame.Position).LookVector * 50
                    
                end)]]
               
                task.spawn(function()
                    while HitboxExist == true do
                        LinearVelocity.VectorVelocity = CFrame.lookAt(Attachment.WorldCFrame.Position, AttachCenter.WorldCFrame.Position).LookVector * 50
                        task.wait(0.5)
                    end
                end)
                

                Hitbox.Destroying:Connect(function()
                    Attachment:Destroy()
                    --AllingPosition:Destroy()
                   LinearVelocity:Destroy()
                   --Heartbeat:Disconnect()
                   HitboxExist = false
                    debounce[Character]= nil
                end)

            end
            

        end)

	    
    end,
    ["Red"] = function(Hitbox,Player)
        local AttachCenter = Instance.new("Attachment",Hitbox)
       local debounce = {}
       Hitbox.Touched:Connect(function(Hit)
        local Character = Hit.Parent   
            if Character:FindFirstChild("Humanoid") then
                local playerTarget = Players:GetPlayerFromCharacter(Character)  

                

                if debounce[Character] or Player == playerTarget then return end
                
                


                local Attachment = Instance.new("Attachment",Character.HumanoidRootPart)
                local LinearVelocity = Instance.new("LinearVelocity", Attachment)
                LinearVelocity.Attachment0 = Attachment
                LinearVelocity.MaxForce = math.huge
                debounce[Character] = true



                LinearVelocity.VectorVelocity = CFrame.lookAt(AttachCenter.WorldCFrame.Position, Attachment.WorldCFrame.Position).LookVector * 20



                Hitbox.Destroying:Connect(function()
                    Attachment:Destroy()
                   LinearVelocity:Destroy()
                   
                    debounce[Character]= nil
                end)




            end
        end)
    end,
    ["Purple"] = function(Hitbox,Player)
        Hitbox.Touched:Connect(function(Hit)
    
        
        
        local Character = Hit.Parent   
            if Character:FindFirstChild("Humanoid") then
                local playerTarget = Players:GetPlayerFromCharacter(Character)  

                if Player == playerTarget then return end

                

            end   
        end)

    end

    



}



return PowerEffect