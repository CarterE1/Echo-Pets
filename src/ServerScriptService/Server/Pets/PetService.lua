local PetsConfig = require(game.ReplicatedStorage.Shared.Config.Pets)

local PetService = {}

-- Creates a new pet based on the given pet ID and owner user ID
function PetService:CreateNewPet(petID, ownerUserId)
    local petConfig = PetsConfig[petID]
    if not petConfig then
      warn("Invalid pet ID: " .. tostring(petID))
      return nil
    end

    local petData = petConfig
    petData.UUID = tostring(game:GetService("HttpService"):GenerateGUID(false))
    petData.OwnerUserId = ownerUserId

  return petData
end

return PetService

