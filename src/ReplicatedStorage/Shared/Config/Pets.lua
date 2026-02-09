return {
  Anger = {
    UUID = nil, -- To be assigned when the pet is created
    PetID = "Anger",
    Name = "Anger",
    Description = "A fiery pet that embodies rage and power.",
    Level = 1,
    Stage = 1,
    Ascension = 1,
    Rarity = "Rare",
    Type = "Fire",
    Attributes = {
      MaxHealth = 50,
      CurrentHealth = 50,
      Attack = 60,
      Defense = 50,
      Speed = 35,
      CritChance = 5,
    },
    SpeedBar = 0,
    Skills = {
      {SkillID = "Flame Burst", IsLearned = true}, -- Attack an enemy once
      {SkillID = "Rage Strike", IsLearned = false}, -- Attack an enemy. Damage increases with lower health.
    },
    Effects = {}, -- No status effects at creation
    OwnerUserId = nil, -- To be set when the pet is owned
  },
  Sad = {
    UUID = nil, -- To be assigned when the pet is created
    PetID = "Sad",
    Name = "Sad",
    Description = "A melancholy pet that embodies sadness and sorrow.",
    Level = 1,
    Stage = 1,
    Ascension = 1,
    Rarity = "Rare",
    Type = "Water",
    Attributes = {
      MaxHealth = 55,
      CurrentHealth = 55,
      Attack = 52,
      Defense = 46,
      Speed = 30,
      CritChance = 4,
    },
    SpeedBar = 0,
    Skills = {
      {SkillID = "Weeping Cry", IsLearned = true}, -- Attack an enemy once
      {SkillID = "Sorrow Aura", IsLearned = false}, -- Attack all enemies
    },
    Effects = {}, -- No status effects at creation
    OwnerUserId = nil, -- To be set when the pet is owned
  },
  Courage = {
    UUID = nil, -- To be assigned when the pet is created
    PetID = "Courage",
    Name = "Courage",
    Description = "A brave pet that embodies courage and determination.",
    Level = 1,
    Stage = 1,
    Ascension = 1,
    Rarity = "Rare",
    Type = "Earth",
    Attributes = {
      MaxHealth = 65,
      CurrentHealth = 65,
      Attack = 57,
      Defense = 50,
      Speed = 32,
      CritChance = 5,
    },
    SpeedBar = 0,
    Skills = {
      {SkillID = "Charge of Valor", IsLearned = true}, -- Attack an enemy once
      {SkillID = "Inspiring Shout", IsLearned = false}, -- Buff attack of all allies for 2 turns
    },
    Effects = {}, -- No status effects at creation
    OwnerUserId = nil, -- To be set when the pet is owned
  },
  Happy = {
    UUID = nil, -- To be assigned when the pet is created
    PetID = "Happy",
    Name = "Happy",
    Description = "A cheerful pet that embodies joy and happiness.",
    Level = 1,
    Stage = 1,
    Ascension = 1,
    Rarity = "Rare",
    Type = "Fire",
    Attributes = {
      MaxHealth = 60,
      CurrentHealth = 60,
      Attack = 60,
      Defense = 52,
      Speed = 40,
      CritChance = 6,
    },
    SpeedBar = 0,
    Skills = {
      {SkillID = "Joyful Cheer", IsLearned = true}, -- Attack an enemy once
      {SkillID = "Celebration Blast", IsLearned = false}, -- Attack all enemies
    },
    Effects = {}, -- No status effects at creation
    OwnerUserId = nil, -- To be set when the pet is owned
  },



  --   export type PetData = {
--     UUID: string, -- Unique identifier for the pet
--     PetID: string, -- Identifier corresponding to the pet type
--     Name: string, -- Name given to the pet by the player
--     Description: string, -- Description of the pet
--     Level: number, -- Current level of the pet
--     Stage: number, -- Evolution stage of the pet
--     Ascension: number, -- Ascension level of the pet
--     Rarity: string, -- Rarity classification (e.g., Rare, Epic, Legendary)
--     Type: string, -- Elemental type (e.g., Fire, Water, Earth, Metal, Wood)
--     Attributes: { -- Base attributes of the pet
--         Health: number,
--         Attack: number,
--         Defense: number,
--         Speed: number,
--         CritChance: number,
--     },
--     Skills: { -- Skills learned by the pet
--         [string]: boolean, -- SkillID mapped to whether the pet has learned it
--     },
--     OwnerUserId: number, -- UserId of the pet's owner
-- }
}