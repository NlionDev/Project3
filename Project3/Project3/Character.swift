//
//  characters.swift
//  Project3
//
//  Created by Nicolas Lion on 14/10/2018.
//  Copyright © 2018 Nicolas Lion. All rights reserved.
//

//enum CharacterType: Int {
//    case Warrior = 1
//    case Magus = 2
//    case Colossus = 3
//    case Dwarf = 4
//
//
//    var weapon: Weapon {
//        switch self {
//        case .Warrior: return
//        case .Magus: return MagicWand()
//        case .Colossus: return OneHandedMass()
//        case .Dwarf: return TwoHandedAxe()
//
//        }
//    }
//
//    var life: Int {
//            switch self {
//        case .Warrior: return 100
//        case.Magus: return 80
//        case .Colossus: return 150
//        case .Dwarf: return 60
//        }
//    }
//
//    var type: String {
//        switch self {
//        case .Warrior: return "Warrior"
//        case .Magus: return "Magus"
//        case.Colossus: return "Colossus"
//        case.Dwarf: return "Dwarf"
//        }
//    }
//
//}

class CharacterFactory {
    enum CharacterType: Int {
        case Warrior = 1
        case Magus = 2
        case Colossus = 3
        case Dwarf = 4
    }
    
    var weaponFactory = WeaponFactory()
    
    func create(_ type: CharacterType, name: String) -> Character {
        switch type {
        case .Warrior: return Character(name: name, type: "Warrior", life: 100, weapon: weaponFactory.create(.OneHandedSword))
        case .Magus: return Character(name: name, type: "Magus", life: 80, weapon: weaponFactory.create(.MagicWand))
        case .Colossus: return Character(name: name, type: "Colossus", life: 150, weapon: weaponFactory.create(.OneHandedMass))
        case .Dwarf: return Character(name: name, type: "Dwarf", life: 60, weapon: weaponFactory.create(.TwoHandedAxe))
        }
    }
}

// Class Character Initialization
class Character {
    var name: String
    var type: String
    var life: Int
    var weapon: Weapon

    init (name: String, type: String, life: Int, weapon: Weapon) {
        self.name = name
        self.type = type
        self.life = life
        self.weapon = weapon
    }
    
    // Function for the character to attack
    func attack(character: Character) {
        character.takeDamages(damages: weapon.damages)
    }

    
    // Function for the character to heal
    func heal(character: Character) {
        character.takeHeal(heal: weapon.heal)
    }
    
    
    

    
    // Function for the character to receive damages
    func takeDamages(damages: Int) {
        life -= damages
        if life < 0 {
            life = 0
        }
    }
    

    // Function for the character to receive heal
    func takeHeal(heal: Int) {
        life += heal
    }
   
    }


