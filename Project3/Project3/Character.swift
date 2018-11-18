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

    init (characterName: String, characterType: CharacterType) {
        self.characterName = characterName
        self.characterType = characterType
    }
    
    // Function for the character to attack
    func attack(character: Character) {
        character.takeDamages(damages: weapon.damages)
    }

    
    // Function for the character to heal
    func heal(character: Character) {
        character.takeHeal(heal: weapon.heal)
    }
    
    func action() -> Void {
        switch characterType {
        case .Warrior: return attack
        case .Magus: return heal
        case .Colossus: return attack
        case .Dwarf: return attack
            
        }
        
    }
    

    
// Function for the character to receive damages
    func takeDamages(damages: Int) {
        life = life - damages
        
        if life < 0 {
            life = 0
        }
    }
    

    
// Function for the character to receive heal
    func takeHeal(heal: Int) {
        life = life + heal
    }
}


