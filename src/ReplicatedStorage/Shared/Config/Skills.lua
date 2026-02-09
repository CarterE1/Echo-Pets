return {

  -- Config:
  --["Name"] = {
  --  Name = "Name",
  --  Description = "Description of the skill.",
  --  Type = "Attack" | "Buff" | "Debuff" | "Heal",
  --  Power = number, -- Value representing the skill's power/damage/heal amount
  --  Target = "SingleEnemy" | "AllEnemies" | "Self" | "Ally" | "AllAllies",
  --  Element = "Wood" | "Earth" | "Water" | "Fire" | "Metal",
  --  Cooldown = number, -- Number of turns before the skill can be used again
  --  Buffs = { -- Optional, only for Buff/Debuff type skills
  --    [string] = { -- BuffID
  --      Duration = number, -- Number of turns the buff/debuff lasts
  --    }
  --  },
  --  Debuffs = { -- Optional
  --    [string] = { -- BuffID
  --      Duration = number,
  --    }
  --  },
  -- },

  ["Flame Burst"] = {
    Name = "Flame Burst",
    Description = "Attack an enemy once with a burst of flame.",
    Type = "Attack",
    Power = 50,
    Target = "SingleEnemy",
    Element = "Fire",
    Cooldown = 0,
  },
  ["Rage Strike"] = {
    Name = "Rage Strike",
    Description = "Attack an enemy. Damage increases with lower health.",
    Type = "Attack",
    Power = 40,
    Target = "SingleEnemy",
    Element = "Fire",
    Cooldown = 1,
  },
  ["Weeping Cry"] = {
    Name = "Weeping Cry",
    Description = "Attack an enemy once with a sorrowful cry.",
    Type = "Attack",
    Power = 45,
    Target = "SingleEnemy",
    Element = "Water",
    Cooldown = 0,
  },
  ["Sorrow Aura"] = {
    Name = "Sorrow Aura",
    Description = "Attack all enemies with an aura of sadness.",
    Type = "Attack",
    Power = 30,
    Target = "AllEnemies",
    Element = "Water",
    Cooldown = 2,
  },
  ["Charge of Valor"] = {
    Name = "Charge of Valor",
    Description = "Attack an enemy once with a courageous charge.",
    Type = "Attack",
    Power = 55,
    Target = "SingleEnemy",
    Element = "Earth",
    Cooldown = 0,
  },
  ["Inspiring Shout"] = {
    Name = "Inspiring Shout",
    Description = "Buff attack of all allies for 2 turns.",
    Type = "Buff",
    Power = 0,
    Target = "AllAllies",
    Element = "Earth",
    Buffs = {
      -- ["AttackBoost"] = {
      --   Duration = 2,
      -- },
    },
    Cooldown = 3,
  },
  ["Joyful Cheer"] = {
    Name = "Joyful Cheer",
    Description = "Attack an enemy once with a joyful cheer.",
    Type = "Attack",
    Power = 50,
    Target = "SingleEnemy",
    Element = "Fire",
    Cooldown = 0,
  },
  ["Celebration Blast"] = {
    Name = "Celebration Blast",
    Description = "Attack all enemies with a blast of celebration.",
    Type = "Attack",
    Power = 35,
    Target = "AllEnemies",
    Element = "Fire",
    Cooldown = 2,
  },
}