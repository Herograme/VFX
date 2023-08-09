local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")

local remote = ReplicatedStorage.PowerSystem.Remotes
local MovimentTypes = require(ReplicatedStorage.PowerSystem.MovimentTypes)

local debouce = {}


local function  CheckPlayerPower(player,SkillName)
    
   --[[ local skill_E = player:GetAttribute("Skill_E")
    local skill_Q = player:GetAttribute("Skill_Q")
    local skill_R = player:GetAttribute("Skill_R")
    
    if SkillName ==  skill_R or SkillName == skill_E or SkillName == skill_Q then
        return true
    end]]
    local skills = player:GetAttributes()
    print(skills,SkillName)
    return table.find(skills,SkillName)

end

local function HitBOX(player,SkillName,Origin,Direction)
    local hitbox = Instance.new("Part")
    hitbox.Shape = Enum.PartType.Ball
    hitbox.Size = Vector3.new(8,8,8)
    hitbox.Transparency = 0.4
    hitbox.Color=Color3.fromRGB(255,0,0)
    MovimentTypes.linear(hitbox,Origin,Direction,50)
    hitbox.Parent = Workspace.PowerSpawned
    hitbox.Name = "HitBox_"..SkillName.."_"..player.Name

end

local function SpawnSkill(player,SkillName,Origin,Direction)
    local Position = player.Character
    remote.SummonPower:FireAllClients(SkillName,Origin,Direction)
    HitBOX(SkillName,Origin,Direction)
    

    
end




remote.SummonPower.OnServerEvent:connect(function(player,SkillName,Origin,Direction)
    local Checked =  CheckPlayerPower(player,SkillName)
    print(Checked)
    if not SkillName or not Origin or not Direction then
        return warn("Invalid Arguments")
    end

    if not debouce[player]  then
        debouce[player] = true 
        SpawnSkill(player,SkillName,Origin,Direction)
        task.wait(3)
        debouce[player] = nil
    end
    
    
end)

