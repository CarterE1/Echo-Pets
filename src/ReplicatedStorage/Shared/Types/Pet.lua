export type PetData = {
    UUID: string, -- Unique identifier for the pet
    PetID: string, -- Identifier corresponding to the pet type
    Name: string, -- Name given to the pet by the player
    Description: string, -- Description of the pet
    Level: number, -- Current level of the pet
    Stage: number, -- Evolution stage of the pet
    Ascension: number, -- Ascension level of the pet
    Rarity: string, -- Rarity classification (e.g., Rare, Epic, Legendary)
    Type: string, -- Elemental type (e.g., Fire, Water, Earth, Metal, Wood)
    Attributes: { -- Base attributes of the pet
        Health: number,
        Attack: number,
        Defense: number,
        Speed: number,
        CritChance: number,
    },
    Skills: { -- Skills learned by the pet
        [string]: boolean, -- SkillID mapped to whether the pet has learned it
    },
    OwnerUserId: number, -- UserId of the pet's owner
}