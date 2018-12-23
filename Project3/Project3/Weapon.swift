//
//  weapons.swift
//  Project3
//
//  Created by Nicolas Lion on 14/10/2018.
//  Copyright © 2018 Nicolas Lion. All rights reserved.
//

/// Class Weapon Initialization
class Weapon {
    
/// Property for the damage of the weapon
    internal var damages: Int
    
/// Property for the quantity of heal
    internal var heal: Int
    
/// Property to differentiate heal and attack weapons
    internal var isAttack: Bool
    
/// Property for the weapon's name
    internal var name: String
    
    init(damages: Int, heal: Int, isAttack: Bool, name: String) {
        self.damages = damages
        self.heal = heal
        self.isAttack = isAttack
        self.name = name
    }
}

/// Class Weapon Factory Initialization
class WeaponFactory {
    
/// Enumeration of all weapons
    enum Category: Int {
        case OneHandedSword = 1
        case TwoHandedSword = 2
        case OneHandedMass = 3
        case TwoHandedMass = 4
        case OneHandedAxe = 5
        case TwoHandedAxe = 6
        case Scepter = 7
        case MagicStick = 8
        case MagicWand = 9
    }
    
/// Function that will create the weapons
    internal func create(_ category: Category) -> Weapon {
        switch category {
        case .OneHandedSword: return Weapon(damages: 10, heal: 0, isAttack: true, name: "One Handed Sword")
        case .TwoHandedSword: return Weapon(damages: 15, heal: 0, isAttack: true, name: "Two Handed Sword")
        case .OneHandedMass: return Weapon(damages: 5, heal: 0, isAttack: true, name: "One Handed Mass")
        case .TwoHandedMass: return Weapon(damages: 12, heal: 0, isAttack: true, name: "Two Handed Mass")
        case .OneHandedAxe: return Weapon(damages: 8, heal: 0, isAttack: true, name: "One Handed Axe")
        case .TwoHandedAxe: return Weapon(damages: 20, heal: 0, isAttack: true, name: "Two Handed Axe")
        case .Scepter: return Weapon(damages: 0, heal: 13, isAttack: false, name: "Scepter")
        case .MagicStick: return Weapon(damages: 0, heal: 10, isAttack: false, name: "Magic Stick")
        case .MagicWand: return Weapon(damages: 0, heal: 7, isAttack: false, name: "Magic Wand")
        }
    }
}
