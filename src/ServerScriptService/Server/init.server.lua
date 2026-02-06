local PlayerDataService = require(
    script.Data.PlayerDataService
)

PlayerDataService:Init()

-- DEBUGGING PURPOSES ONLY
local Players = game:GetService("Players")
Players.PlayerAdded:Connect(function(player)
    task.wait(5)
    -- DO NOT REMOVE COMMENTS UNLESS RESETTING DATA IS INTENDED
    --PlayerDataService:ResetProfileData(PlayerDataService:GetProfile(player))
    print("Coins: " .. PlayerDataService:GetProfile(player).Data.Currencies.Coins)
    print("Pets count: " .. #PlayerDataService:GetProfile(player).Data.Pets)
end)