//
//  characters.swift
//  Project3
//
//  Created by Nicolas Lion on 14/10/2018.
//  Copyright © 2018 Nicolas Lion. All rights reserved.
//

//enum Character {
//    case Warrior
//    case Magus
//    case Colossus
//    case Dwarf
//
//    var name: String {
//        switch self {
//        case .Warrior: return ""
//        case .Magus: return ""
//        case .Colossus: return ""
//        case .Dwarf: return ""
//        }
//    }
//
//    var weapon: Weapon {
//        switch self {
//        case .Warrior: return OneHandedSword()
//        case .Magus: return MagicWand()
//        case .Colossus: return OneHandedMass()
//        case .Dwarf: return TwoHandedAxe()
//
//        }
//    }
//
//    var life: Int {
//        switch self {
//        case .Warrior: return 100
//        case.Magus: return 80
//        case .Colossus: return 150
//        case .Dwarf: return 60
//        }
//    }
//
//}

// Class Character Initialization
class Character {
    var characterName: String
    var life: Int
    var type: String
    var weapon: Weapon

    init (characterName: String, life: Int, type: String, weapon: Weapon) {
        self.characterName = characterName
        self.life = life
        self.type = type
        self.weapon = weapon
    }
    
// Function for the character to attack
    func attack(character: Character) {
        character.takeDamages(damages: weapon.damages)
    }

    
// Function for the character to receive damages
    func takeDamages(damages: Int) {
        life = life - damages
        
        if life < 0 {
            life = 0
        }
    }
    
// Function for the character to heal
    func heal(character: Character) {
        character.takeHeal(heal: weapon.heal)
    }
    
// Function for the character to receive heal
    func takeHeal(heal: Int) {
        life = life + heal
    }
}

// Class Warrior Initialization
class Warrior: Character {
    init() {
        super.init(characterName: "", life: 100, type: "Warrior", weapon: OneHandedSword())
    }

}

// Class Magus Initialization
class Magus: Character {
    init() {
        super.init(characterName: "", life: 80, type: "Magus", weapon: MagicWand())
    }
}

// Class Colossus Initialization
class Colossus: Character{
    init() {
        super.init(characterName: "", life: 150, type: "Colossus", weapon: OneHandedMass())
    }
}

//Class Dwarf Initialization
class Dwarf: Character {
    init() {
        super.init(characterName: "", life: 60, type: "Dwarf", weapon: TwoHandedAxe())
    }
}




