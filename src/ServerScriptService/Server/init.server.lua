local PlayerDataService = require(
    script.Data.PlayerDataService
)

PlayerDataService:Init()

-- DEBUGGING PURPOSES ONLY
local Players = game:GetService("Players")
local BattleSimulator = require(script.Battle.BattleSimulator)
local PetService = require(script.Pets.PetService)
Players.PlayerAdded:Connect(function(player)
    task.wait(5)
    -- DO NOT REMOVE COMMENTS UNLESS RESETTING DATA IS INTENDED
    --PlayerDataService:ResetProfileData(PlayerDataService:GetProfile(player))
    -- print("Coins: " .. PlayerDataService:GetProfile(player).Data.Currencies.Coins)
    -- print("Pets count: " .. #PlayerDataService:GetProfile(player).Data.Pets)
    print("SIMULATING BATTLE -------------------------")
    local pet1 = PetService:CreateNewPet("Courage", player.UserId)
    local pet2 = PetService:CreateNewPet("Happy", player.UserId)
    local pet3 = PetService:CreateNewPet("Sad", player.UserId)
    local pet4 = PetService:CreateNewPet("Anger", player.UserId)
    local enemyPet1 = PetService:CreateNewPet("Courage", player.UserId)
    local enemyPet2 = PetService:CreateNewPet("Happy", player.UserId)
    local enemyPet3 = PetService:CreateNewPet("Happy", player.UserId)
    local enemyPet4 = PetService:CreateNewPet("Happy", player.UserId)
    local playerTeam = {pet1, pet2, pet3, pet4}
    local enemyTeam = {enemyPet1, enemyPet2, enemyPet3, enemyPet4}
    BattleSimulator:SimulateBattle(playerTeam, enemyTeam)

end)