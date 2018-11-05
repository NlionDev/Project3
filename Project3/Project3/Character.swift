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
//
//    var weapon: AttackWeapon {
//        switch self {
//        case .Warrior: return OneHandedSword()
//        case .Magus: return OneHandedMass()
//        }
//    }
//
//    var life: Int {
//        switch self {
//        case .Warrior: return 100
//        case .Magus: return 80
//        }
//    }
//}

// Class Character Initialization
class Character {
    var characterName: String
    var life: Int
    
    init (characterName: String, life: Int) {
        self.characterName = characterName
        self.life = life
    }
    
//    func attack(character: Character) {
//        character.takeDamages(damages: weapon.damages)
//    }
//    
//    func heal(character: Character) {
//        character.takeHeal(heal: weapon.heal)
//    }
    
    func takeHeal(heal: Int) {
        life = life + heal
    }
    
    func takeDamages(damages: Int) {
        life = life - damages
        
        if life < 0 {
            life = 0
        }
    }
    
}

// Class Warrior Initialization
class Warrior: Character {
    init() {
        super.init(characterName: "", life: 100)
    }
    var weapon = OneHandedSword()
    
    func attack(character: Character) {
        character.takeDamages(damages: weapon.damages)
    }
   
}

// Class Magus Initialization
class Magus: Character {
    init() {
        super.init(characterName: "", life: 80)
    }
    var weapon = MagicWand()
    
    func heal(character: Character) {
        character.takeHeal(heal: weapon.heal)
    }
}

// Class Colossus Initialization
class Colossus: Character{
    init() {
        super.init(characterName: "", life: 150)
    }
    var weapon = OneHandedMass()
    
    func attack(character: Character) {
        character.takeDamages(damages: weapon.damages)
    }
    
}

//Class Dwarf Initialization
class Dwarf: Character {
    init() {
        super.init(characterName: "", life: 60)
    }
    var weapon = TwoHandedAxe()
    
    func attack(character: Character) {
        character.takeDamages(damages: weapon.damages)
    }
}




