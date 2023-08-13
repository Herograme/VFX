local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerStorage = game:GetService("ServerStorage")
--local Debris = game:GetService("Debris")


local PowerSystem = ReplicatedStorage:WaitForChild("PowerSystem")
local Remotes = PowerSystem.Remotes

local HitboxModule = require(ServerStorage.HitBoxData)


local Debounce = {}

local function GetSkillName(Player, SkillType)
    print(Player:GetAttributes(),SkillType, Player:GetAttribute(SkillType))
    return Player:GetAttribute(SkillType)

end

function CreateHitbox(Player, SkillName, Origin, Direction) 
    local HitBoxFunction = HitboxModule[SkillName]

    if not HitBoxFunction then return end

    local Hitbox = HitBoxFunction(Player,SkillName,Origin,Direction)

    -- O erro aqui era voce não estar enviando o player, logo Direction era nil(o takeshi é meio chato com formatação)

    
   
    return Hitbox

end

function FireSkill(Player, SkillName, Direction)

    local Character = Player.Character
    local RightHand = Character and Character:FindFirstChild("RightHand")
    local Origin = RightHand and RightHand.RightGripAttachment.WorldCFrame -- Pega a origem

    if not Origin then return end -- Caso não tenha Character ou RightHand, não havera Origin, logo, serve para não dar erro

    local Hitbox = CreateHitbox(Player, SkillName, Origin, Direction)

    Remotes.SummonPower:FireAllClients(SkillName, Hitbox)

end

function ServerReceive(Player, SkillType, Direction)

    local SkillName =  GetSkillName(Player, SkillType)
    local UserId = Player.UserId

    if not SkillName or not Direction then
        return warn("Invalid Arguments")
    end

    if not Debounce[SkillName..UserId] then -- Debounce por skill

        Debounce[SkillName..UserId] = true 
        FireSkill(Player, SkillName, Direction)

        task.wait(3)
        Debounce[SkillName..UserId] = nil

    end

end

Remotes.SummonPower.OnServerEvent:Connect(ServerReceive)