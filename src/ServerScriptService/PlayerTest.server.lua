local Players = game:GetService("Players")







Players.PlayerAdded:Connect(function(player)
    player:SetAttribute("Skill_R",nil)
    player:SetAttribute("Skill_Q",nil)
    player:SetAttribute("Skill_E","Blue")
end)