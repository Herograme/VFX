 local Debris = game:GetService("Debris")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerStorage = game:GetService("ServerStorage")

 local PowerSystem = ReplicatedStorage:WaitForChild("PowerSystem")
 local MovimentTypes = require(PowerSystem.MovimentTypes)
 local PowerEffect = require(ServerStorage.PowerEffect)
 
 
 
 
 HitBox = {

    ["Blue"] = function(Player,SkillName,Origin,Direction)

        local Hitbox = Instance.new("Part")
        local Hitbox2 = Instance.new("Part")
        local WldConstrain = Instance.new("WeldConstraint")



        Hitbox.Shape = Enum.PartType.Ball
        Hitbox.Size = Vector3.new(2,2,2)
        Hitbox.Transparency = 0.4
        Hitbox.Color=Color3.fromRGB(255,0,0)
        Hitbox:PivotTo(Origin)
        Debris:AddItem(Hitbox, 6)
        Hitbox.Parent = workspace.PowerSpawned
        Hitbox.Name = "HitBox_"..SkillName.."_"..Player.UserId

        Hitbox2.Shape = Enum.PartType.Ball
        Hitbox2.Size = Vector3.new(15,15,15) 
        Hitbox2.Transparency = 0.4
        Hitbox2.Color = Color3.fromRGB(255,0,0)
        Hitbox2:PivotTo(Hitbox.CFrame)
        Debris:AddItem(Hitbox2, 6)
        Hitbox2.Parent = Hitbox
        Hitbox2.CanCollide = false
        

        WldConstrain.Part0 = Hitbox
        WldConstrain.Part1 = Hitbox2
        WldConstrain.Parent = Hitbox


        Hitbox.CanCollide =  false

        task.delay(0.2,function()
            Hitbox.CanCollide =  true
        end)
        
        

        local PowerEffectFunction = PowerEffect["Blue"]
        print(PowerEffectFunction)
        if not PowerEffectFunction or not Hitbox2 or not Hitbox then return end
        print("a")
         PowerEffectFunction(Hitbox2,Player)
        print("b")

        MovimentTypes.linear(Hitbox, Origin, Direction, 30)

        print("c")
        return Hitbox
    end,
    
    ["Red"] = function(Player,SkillName,Origin,Direction)
        
    end







}






return HitBox