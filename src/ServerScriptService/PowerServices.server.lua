local ReplicatedStorage = game:GetService("ReplicatedStorage")

local PowerSystem = ReplicatedStorage:WaitForChild("PowerSystem")
local Remotes = PowerSystem.Remotes
local MovimentTypes = require(PowerSystem.MovimentTypes)

local Debounce = {}

local function GetSkillName(Player, SkillType)
    print(Player:GetAttributes(),SkillType, Player:GetAttribute(SkillType))
    return Player:GetAttribute(SkillType)

end

function CreateHitbox(Player, SkillName, Origin, Direction) 
    
    -- O erro aqui era voce não estar enviando o player, logo Direction era nil

    local Hitbox = Instance.new("Part")

    Hitbox.Shape = Enum.PartType.Ball
    Hitbox.Size = Vector3.new(8,8,8)
    Hitbox.Transparency = 0.4
    Hitbox.Color=Color3.fromRGB(255,0,0)
    Hitbox.Parent = workspace.PowerSpawned
    Hitbox.Name = "HitBox_"..SkillName.."_"..Player.UserId

    MovimentTypes.linear(Hitbox, Origin, Direction, 50)

end

function FireSkill(Player, SkillName, Direction)

    local Character = Player.Character
    local RightHand = Character and Character:FindFirstChild("RightHand")
    local Origin = RightHand and RightHand.RightGripAttachment.WorldCFrame -- Pega a origem

    if not Origin then return end -- Caso não tenha Character ou RightHand, não havera Origin, logo, serve para não dar erro

    Remotes.SummonPower:FireAllClients(SkillName, Origin, Direction)

    CreateHitbox(Player, SkillName, Origin, Direction)

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