local Players = game:GetService("Players")



--[[function CollisionGroupSet(character)
    for _,v in pairs(character:GetChildren()) do
        if v:IsA("BasePart") then
            v.CollisionGroup = "Combat"
        end
    end
end
]]



Players.PlayerAdded:Connect(function(player)
    player:SetAttribute("Skill_R","Purple")
    player:SetAttribute("Skill_Q","Red")
    player:SetAttribute("Skill_E","Blue")

    
    
    --[[if player.Character then
      CollisionGroupSet(player.Character)
    end
    
    player.CharacterAdded:Connect(CollisionGroupSet)]]
end)

