 local Debris = game:GetService("Debris")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerStorage = game:GetService("ServerStorage")

 local PowerSystem = ReplicatedStorage:WaitForChild("PowerSystem")
 local MovimentTypes = require(PowerSystem.MovimentTypes)
 local PowerEffect = require(ServerStorage.PowerEffect)


 local function IsAtarget(Hitbox,Player,Damage,TimeDuration)
    Debris:AddItem(Hitbox, TimeDuration)
  local touched = task.spawn(function()
        local debounce = {}
        Hitbox.Touched:Connect(function(Hit)
            local character = Hit.Parent
            
            if character:FindFirstChild("Humanoid") then
            debounce[character] = true  
            local PlayerTarget = Players:GetPlayerFromCharacter(Hit.Parent)
            local Humanoid = character:FindFirstChild("Humanoid")
                if Player == PlayerTarget or debounce[character]== true then return end
                
                Humanoid.Health -= Damage

                task.wait(0.5)
                debounce[character] = nil

            end



        end)

        

    end)

    Hitbox.Destroying:Connect(function()

        --Hitbox:Disconnect()
        task.cancel(touched)
        
    end)   

 end  



 function BlueAndRed(Player,SkillName,Origin,Direction)
    local Hitbox = Instance.new("Part")
        local Hitbox2 = Instance.new("Part")
        local WldConstrain = Instance.new("WeldConstraint")



        Hitbox.Shape = Enum.PartType.Ball
        Hitbox.Size = Vector3.new(2,2,2)
        Hitbox.Transparency = 0.4
        Hitbox.Color=Color3.fromRGB(255,0,0)
        Hitbox:PivotTo(Origin)
        
        Hitbox.Parent = workspace.PowerSpawned
        Hitbox.Name = "HitBox_"..SkillName.."_"..Player.UserId

        Hitbox2.Shape = Enum.PartType.Ball
        Hitbox2.Size = Vector3.new(15,15,15) 
        Hitbox2.Transparency = 0.4
        Hitbox2.Color = Color3.fromRGB(255,0,0)
        Hitbox2:PivotTo(Hitbox.CFrame)
        
        Hitbox2.Parent = Hitbox
        Hitbox2.CanCollide = false
        

        WldConstrain.Part0 = Hitbox
        WldConstrain.Part1 = Hitbox2
        WldConstrain.Parent = Hitbox


        Hitbox.CanCollide =  false
        Hitbox.CollisionGroup = "Combat2"

        --[[task.delay(0.2,function()
            Hitbox.CanCollide =  true
        end)]]
        
        

        local PowerEffectFunction = PowerEffect[SkillName]
        print(PowerEffectFunction)
        if not PowerEffectFunction or not Hitbox2 or not Hitbox then return end
        print("a")
         PowerEffectFunction(Hitbox2,Player)
        print("b")

        MovimentTypes.linear(Hitbox, Origin, Direction, 30)

        IsAtarget(Hitbox,Player,15,6)
        
        
        print("c")
        return Hitbox
 end
 
 
 HitBox = {

    ["Blue"] = function(Player,SkillName,Origin,Direction)

       local Hitbox =  BlueAndRed(Player,SkillName,Origin,Direction)
        return Hitbox
    end,
    
    ["Red"] = function(Player,SkillName,Origin,Direction)
        
        local Hitbox = BlueAndRed(Player,SkillName,Origin,Direction)
        return Hitbox
    end,

    ["Purple"] = function(Player,SkillName,Origin,Direction)
        local Hitbox = Instance.new("Part")
        Hitbox.Shape = Enum.PartType.Ball
        Hitbox.Size = Vector3.new(20,20,20)
        Hitbox.Transparency = 1
        Hitbox.CanCollide = false



        local PowerEffectFunction = PowerEffect[SkillName]



        if not PowerEffectFunction or not Hitbox then return end

        PowerEffectFunction(Hitbox,Player)

        MovimentTypes.linear(Hitbox, Origin, Direction, 30)

        Debris:AddItem(Hitbox,6)

        Hitbox.Touched:Connect(function(Hit)
            local character = Hit.Parent
            
            if character:FindFirstChild("Humanoid") then
            local PlayerTarget = Players:GetPlayerFromCharacter(Hit.Parent)
            
                if Player == PlayerTarget then return end
                
                character:Destroy()


            end

            


        end)

       -- Hitbox.Destroying:Connect(function()Hitbox:Disconnect()end)
        
        return Hitbox
    end







}






return HitBox