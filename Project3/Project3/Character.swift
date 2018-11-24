//
//  characters.swift
//  Project3
//
//  Created by Nicolas Lion on 14/10/2018.
//  Copyright © 2018 Nicolas Lion. All rights reserved.
//

enum CharacterType: Int {
    case Warrior = 1
    case Magus = 2
    case Colossus = 3
    case Dwarf = 4


    var weapon: Weapon {
        switch self {
        case .Warrior: return OneHandedSword()
        case .Magus: return MagicWand()
        case .Colossus: return OneHandedMass()
        case .Dwarf: return TwoHandedAxe()

        }
    }

    var life: Int {
            switch self {
        case .Warrior: return 100
        case.Magus: return 80
        case .Colossus: return 150
        case .Dwarf: return 60
        }
    }
    
    var type: String {
        switch self {
        case .Warrior: return "Warrior"
        case .Magus: return "Magus"
        case.Colossus: return "Colossus"
        case.Dwarf: return "Dwarf"
        }
    }

}

// Class Character Initialization
class Character {
    var characterName: String
    var characterType: CharacterType
    var characterLife: Int
    var characterWeapon: Weapon

    init (characterName: String, characterType: CharacterType, characterLife: Int, characterWeapon: Weapon) {
        self.characterName = characterName
        self.characterType = characterType
        self.characterLife = characterType.life
        self.characterWeapon = characterType.weapon
    }
    
    // Function for the character to attack
    func attack(character: Character) {
        character.takeDamages(damages: characterWeapon.damages)
    }

    
    // Function for the character to heal
    func heal(character: Character) {
        character.takeHeal(heal: characterWeapon.heal)
    }
    
    
    

    
    // Function for the character to receive damages
    func takeDamages(damages: Int) {
        characterLife -= damages
        if characterLife < 0 {
            characterLife = 0
        }
    }
    

    // Function for the character to receive heal
    func takeHeal(heal: Int) {
        characterLife += heal
    }
   
    }


