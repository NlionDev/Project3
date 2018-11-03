//
//  characters.swift
//  Project3
//
//  Created by Nicolas Lion on 14/10/2018.
//  Copyright © 2018 Nicolas Lion. All rights reserved.
//


// Class Character Initialization
class Character {
    var characterName: String
    var life: Int
    
    init (characterName: String, life: Int) {
        self.characterName = characterName
        self.life = life
    }
    
    func attack() {
        
    }
}

// Class Warrior Initialization
class Warrior: Character {
    init() {
        super.init(characterName: "", life: 100)
    }
    var warriorWeapon = OneHandedSword()
    
   
}

// Class Magus Initialization
class Magus: Character {
    init() {
        super.init(characterName: "", life: 80)
    }
    var magusWeapon = MagicWand()
    
    func heal() {
        
    }
}

// Class Colossus Initialization
class Colossus: Character{
    init() {
        super.init(characterName: "", life: 150)
    }
    var colossusWeapon = OneHandedMass()
    
    
}

//Class Dwarf Initialization
class Dwarf: Character {
    init() {
        super.init(characterName: "", life: 60)
    }
    var dwarfWeapon = TwoHandedAxe()
    
}

//Class Warlock Initialization
class Warlock: Character {
    init() {
        super.init(characterName: "", life: 70)
    }
    
    func fear() {
        
    }
}

