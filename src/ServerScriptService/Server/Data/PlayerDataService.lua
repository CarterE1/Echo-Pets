local Players = game:GetService("Players")

local ProfileService = require(
    game.ReplicatedStorage.Packages.ProfileService
)

local PlayerDataService = {}

local PROFILE_VERSION = "PlayerData_V1"

local ProfileTemplate = {
    Currencies = {
        Coins = 0,
        Diamonds = 0,
        XP = 0
    },

    Pets = {},
    Team = {},

    Progression = {
        Stage = 1
    }
}

local Store = ProfileService.GetProfileStore(
    PROFILE_VERSION,
    ProfileTemplate
)

local Profiles = {}

-- Private functions
function PlayerDataService:GiveCoins(profile, amount)
    -- If "Coins" was not defined in the ProfileTemplate at game launch,
    --   you will have to perform the following:
    if profile.Data.Currencies.Coins == nil then
        profile.Data.Currencies.Coins = 0
    end
    -- Increment the "Coins" value:
    profile.Data.Currencies.Coins = profile.Data.Currencies.Coins + amount
    print("Gave " .. tostring(amount) .. " coins.")
end

function PlayerDataService:AddPet(profile, pet)
    -- If "Coins" was not defined in the ProfileTemplate at game launch,
    --   you will have to perform the following:
    if profile.Data.Pets == nil then
        profile.Data.Pets = {}
    end
    -- Add the pet to the profile's Pets table:
    local instantiatedPet = pet;
    instantiatedPet.UUID = tostring(game:GetService("HttpService"):GenerateGUID(false))
    instantiatedPet.OwnerUserId = profile.UserId

    -- Simple way to buff pets based on level for now, please change
    instantiatedPet.Attributes.Health = instantiatedPet.Attributes.Health + (instantiatedPet.Level - 1) * 10
    instantiatedPet.Attributes.Attack = instantiatedPet.Attributes.Attack + (instantiatedPet.Level - 1) * 8
    instantiatedPet.Attributes.Defense = instantiatedPet.Attributes.Defense + (instantiatedPet.Level - 1) * 5
    instantiatedPet.Attributes.Speed = instantiatedPet.Attributes.Speed + math.floor((instantiatedPet.Level - 1) * 2)
    instantiatedPet.Attributes.CritChance = math.min(50, instantiatedPet.Attributes.CritChance + (instantiatedPet.Level - 1) * 1)

    table.insert(profile.Data.Pets, instantiatedPet)
    print("Added pet " .. instantiatedPet.Name .. " to player ")
end

function PlayerDataService:RemovePet(profile, uuid)
    -- If "Coins" was not defined in the ProfileTemplate at game launch,
    --   you will have to perform the following:
    if profile.Data.Pets == nil then
        profile.Data.Pets = {}
    end
    -- Remove the pet with the given UUID from the profile's Pets table:
    for i, pet in ipairs(profile.Data.Pets) do
        if pet.UUID == uuid then
            table.remove(profile.Data.Pets, i)
            print("Removed pet with UUID " .. uuid .. " from player " .. profile.UserId)
            break
        end
    end
end

function PlayerDataService:ListPets(profile)
    if not profile then
        print("Corrupted profile")
        return
    end
    for i, pet in ipairs(profile.Data.Pets) do
        print(" - Pet: " .. pet.Name .. " (Level " .. tostring(pet.Level) .. ")" .. " UUID: " .. pet.UUID .. " Num: " .. i)
    end
end

function PlayerDataService:ProfileLoaded(player, profile)
    self:GiveCoins(profile, 100)
    print(player.Name .. " owns " .. tostring(profile.Data.Currencies.Coins) .. " coins now! player: ", player)
    print(player.Name .. " owns " .. tostring(#profile.Data.Pets) .. " pets now!")
    self:ListPets(profile)
end

function PlayerDataService:ResetProfileData(profile)
    profile.Data = ProfileTemplate
end

-- Main profile initialization

function PlayerDataService:Init()
    Players.PlayerAdded:Connect(function(player)
        print("Loading profile for player: ", player.Name)
        self:LoadProfile(player)
    end)

    Players.PlayerRemoving:Connect(function(player)
        self:ReleaseProfile(player)
        print("Releasing profile for player: ", player.Name)
    end)
end

function PlayerDataService:LoadProfile(player)
    local profile = Store:LoadProfileAsync(
        "Player_" .. player.UserId
    )

    if not profile then
        player:Kick("Failed to load data.")
        return
    end

    profile:AddUserId(player.UserId)
    profile:Reconcile()

    profile:ListenToRelease(function()
        Profiles[player] = nil
        player:Kick("Data session ended.")
    end)

    if not player:IsDescendantOf(Players) then
        profile:Release()
        return
    end

    Profiles[player] = profile
    self:ProfileLoaded(player, profile)
    print("Profile loaded for player: ", player.Name)
end

function PlayerDataService:GetProfile(player)
    print("Retreived profile for player: ", player.Name)
    return Profiles[player]
end

function PlayerDataService:ReleaseProfile(player)
    local profile = Profiles[player]
    if profile then
        profile:Release()
        print("Successfully released profile for player: ", player.Name)
    end
end

return PlayerDataService
