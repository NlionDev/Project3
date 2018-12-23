//
//  characters.swift
//  Project3
//
//  Created by Nicolas Lion on 14/10/2018.
//  Copyright © 2018 Nicolas Lion. All rights reserved.
//


/// Variable that counts the number of critical strikes inflicted
internal var numberOfCriticalStrike = 0


/// Design pattern factory for create characters
class CharacterFactory {
    
/// Enumeration for all characters type
    enum CharacterType: Int {
        case Warrior = 1
        case Magus = 2
        case Colossus = 3
        case Dwarf = 4
    }
    
    
/// Instance of Weapon Factory
    internal var weaponFactory = WeaponFactory()
    
/// Function that will create characters
    internal func create(_ type: CharacterType, name: String) -> Character {
        switch type {
        case .Warrior: return Character(name: name, type: "Warrior", life: 100, weapon: weaponFactory.create(.OneHandedSword), status: "is alive")
        case .Magus: return Character(name: name, type: "Magus", life: 80, weapon: weaponFactory.create(.MagicWand), status: "is alive")
        case .Colossus: return Character(name: name, type: "Colossus", life: 150, weapon: weaponFactory.create(.OneHandedMass), status: "is alive")
        case .Dwarf: return Character(name: name, type: "Dwarf", life: 60, weapon: weaponFactory.create(.TwoHandedAxe), status: "is alive")
        }
    }
}

/// Class Character Initialization
class Character {
    
/// Property for character's name
    internal var name: String
    
/// Property for character's type ( warrior, magus..)
    internal var type: String
    
/// Property for character's life
    internal var life: Int
    
/// Property for character's weapon
    internal var weapon: Weapon
    
/// Property for character's status ( alive or dead )
    internal var status: String
    
    init (name: String, type: String, life: Int, weapon: Weapon, status: String) {
        self.name = name
        self.type = type
        self.life = life
        self.weapon = weapon
        self.status = status
    }
    
/// Function for the character to attack
    internal func attack(character: Character) {
        character.takeDamages(damages: weapon.damages)
    }
    
    
/// Function for the character to heal
    internal func heal(character: Character) {
        character.takeHeal(heal: weapon.heal)
    }
    
/// Function for the character to receive damages
    internal func takeDamages(damages: Int) {
        
/// Variable to get a random number
        let criticalRandom = Int.random(in: 1...3)
        
/// Variable for the power of the critical strike
        let criticalStrike = damages * 2
        
        if criticalRandom == 2 {
            life -= criticalStrike
            print("Woah, it's a critical strike !")
            numberOfCriticalStrike += 1
        } else {
            life -= damages
        }
        if life < 0 {
            life = 0
        }
    }
    
/// Function for the character to receive heal
    internal func takeHeal(heal: Int) {
        life += heal
    }
    
}


