local StatService = {}

-- Generates battle stats for a pet based on its data, which can be used in combat calculations
function StatService:GetPetStats(petData)
  -- Use function to calculate battle stats based on pet level, stage, ascension, and other factors
  -- Could rework to store battle stats in the pet data itself and update them whenever the pet levels up, evolves, or ascends
  local newPet = table.clone(petData)
  local newPetAttributes = newPet.Attributes
  local levelMultiplier = 1 + (petData.Level - 1) * 0.1 -- 10% increase per level

  newPetAttributes.CurrentHealth = petData.Attributes.CurrentHealth * levelMultiplier
  newPetAttributes.MaxHealth = petData.Attributes.MaxHealth * levelMultiplier
  newPetAttributes.Attack = petData.Attributes.Attack * levelMultiplier
  newPetAttributes.Defense = petData.Attributes.Defense * levelMultiplier
  newPetAttributes.Speed = petData.Attributes.Speed * levelMultiplier
  newPetAttributes.CritChance = petData.Attributes.CritChance * (1 + (petData.Level - 1) * 0.01) -- 1% increase in crit chance per level
  
  print("Generated skills for new pet: " .. tostring(#petData.Skills))
  return newPet
end

return StatService