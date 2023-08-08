local ReplicatedStorage = game:GetService("ReplicatedStorage")

local remote = ReplicatedStorage.PowerSystem.Remotes





local function  CheckPlayerPower(player,SkillName)
    local skill_E = player:GetAttribute("Skill_E")
    local skill_Q = player:GetAttribute("Skill_Q")
    local skill_R = player:GetAttribute("Skill_R")
    
    if SkillName ==  skill_R or SkillName == skill_E or SkillName == skill_Q then
        return true
    end
end

local function SpawnSkill(player,SkillName,Origin,Direction)
    local Position = player.Character
    remote.SummonPower.FireAllClient(SkillName,Origin,Direction)

end




remote.SummonPower.OnServerEvent(function(player,SkillName,Origin,Direction)
    local Checked =  CheckPlayerPower(player,SkillName)
    local debouce = {}
    

    if Checked == true and (not debouce[player]) then
        SpawnSkill(player,SkillName,Origin,Direction)
    end
    
    
end)

