local StatService = require(game.ReplicatedStorage.Shared.Util.StatService)
local SkillConfig = require(game.ReplicatedStorage.Shared.Config.Skills)

local BattleSimulator = {}

-- Possible way to structure teams:
-- local playerTeam = {
--   {
--     petData
--    },
--    ...
-- }

function BattleSimulator:SimulateBattle(playerTeam, enemyTeam)

  for _, pet in ipairs(playerTeam) do
    pet = StatService:GetPetStats(pet)
  end
  for _, pet in ipairs(enemyTeam) do
    pet = StatService:GetPetStats(pet)
  end

  local turn = 0
  while #playerTeam > 0 and #enemyTeam > 0 do
    turn = turn + 1
    print("Turn " .. tostring(turn))
    if turn > 100 then
      print("Battle is taking too long, ending in a draw!")
      return
    end

    -- Determine turn order based on Speed stat of the first pet in each team
    local smallestTimeToAct = math.huge
    
    for _, pet in ipairs(playerTeam) do
      local fillRate = pet.Attributes.Speed
      local timeToAct = (100 - pet.SpeedBar) / fillRate

      if timeToAct < smallestTimeToAct then
        smallestTimeToAct = timeToAct
      end
    end
    for _, pet in ipairs(enemyTeam) do
      local fillRate = pet.Attributes.Speed
      local timeToAct = (100 - pet.SpeedBar) / fillRate

      if timeToAct < smallestTimeToAct then
        smallestTimeToAct = timeToAct
      end
    end

    -- Array to hold pets that will act this turn after we update speed bars
    local nextActors = {}

    -- Advance time and fill speed bars for all pets
    local function checkSpeedBar(pet)
      pet.SpeedBar = math.min(100, pet.SpeedBar + pet.Attributes.Speed * smallestTimeToAct)

      if pet.SpeedBar >= 100 then
        local team, index
        if table.find(enemyTeam, pet) then
          team = "enemy"
          index = table.find(enemyTeam, pet)
        else
          team = "player"
          index = table.find(playerTeam, pet)
        end
        table.insert(nextActors, {team = team, index = index, pet = pet})
      end
    end
    for _, pet in ipairs(playerTeam) do
      checkSpeedBar(pet)
    end
    for _, pet in ipairs(enemyTeam) do
      checkSpeedBar(pet)
    end

    -- Process actions for all pets that are ready to act
    for _, actor in ipairs(nextActors) do
      local pet
      if actor.team == "player" then
        pet = playerTeam[actor.index]
      else -- enemy team
        pet = enemyTeam[actor.index]
      end

      pet.SpeedBar = 0 -- Reset speed bar after acting

      -- VERY SIMPLE ACTION, USE FIRST SKILL ON FIRST ENEMY, PLEASE CHANGE
      if actor.team == "player" then
        local target = enemyTeam[1]
        if target then
          local skill = SkillConfig[target.Skills[1].SkillID]
          target.Attributes.CurrentHealth = target.Attributes.CurrentHealth - pet.Attributes.Attack * (1 + (skill.Power / 100))
          print(pet.Name .. " used " .. skill.Name .. " on " .. target.Name .. " for " .. tostring(pet.Attributes.Attack * (1 + (skill.Power / 100))) .. " damage!")
          if target.Attributes.CurrentHealth <= 0 then
            print(target.Name .. " has been defeated!")
            table.remove(enemyTeam, actor.index) -- Remove defeated enemy from team
          end
        end
      else -- enemy team acting
        local target = playerTeam[1]
        if target then
          local skill = SkillConfig[target.Skills[1].SkillID]
          target.Attributes.CurrentHealth = target.Attributes.CurrentHealth - pet.Attributes.Attack * (1 + (skill.Power / 100))
          print(pet.Name .. " used " .. skill.Name .. " on " .. target.Name .. " for " .. tostring(pet.Attributes.Attack * (1 + (skill.Power / 100))) .. " damage!")
          if target.Attributes.CurrentHealth <= 0 then
            print(target.Name .. " has been defeated!")
            table.remove(playerTeam, actor.index) -- Remove defeated player pet from team
          end
        end
      end
    end
  end

  if #playerTeam > 0 then
    print("Player team wins!")
  else
    print("Enemy team wins!")
  end
end

return BattleSimulator