//
//  weapons.swift
//  Project3
//
//  Created by Nicolas Lion on 14/10/2018.
//  Copyright © 2018 Nicolas Lion. All rights reserved.
//


class Weapon {
    var damages: Int
    var heal: Int
    var isAttack: Bool
    var name: String
    
    init(damages: Int, heal: Int, isAttack: Bool, name: String) {
        self.damages = damages
        self.heal = heal
        self.isAttack = isAttack
        self.name = name
    }
}

class WeaponFactory {
    
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
    
    func create(_ category: Category) -> Weapon {
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
    
//    func createRandomAttackWeapon() -> Weapon {
//        
//    }
//    
//    func createRandomHealWeapon() -> Weapon {
//        
//    }
    
}

////Class AttackWeapons initialization
//class AttackWeapon: Weapon {
//
//}
//
////Class HealWeapons initialization
//class HealWeapon: Weapon {
//
//    }



////Class OneHandedSword Initialization
//class OneHandedSword: AttackWeapon {
//    init() {
//        super.init(damages: 10, heal: 0)
//    }
//}
//
////Class TwoHandedSword Initialization
//class TwoHandedSword: AttackWeapon {
//    init() {
//        super.init(damages: 15, heal: 0)
//    }
//}
//
////Class OneHandedMass Initialization
//class OneHandedMass: AttackWeapon {
//    init() {
//        super.init(damages: 5, heal: 0)
//    }
//}
//
////Class TwoHandedMass Initialization
//class TwoHandedMass: AttackWeapon {
//    init() {
//        super.init(damages: 12, heal: 0)
//    }
//}
//
////Class TwoHandedAxe Initialization
//class TwoHandedAxe: AttackWeapon {
//    init() {
//        super.init(damages: 20, heal: 0)
//    }
//}
//
////Class MagicStick Initialisation
//class MagicStick: HealWeapon {
//    init() {
//        super.init(damages: 0, heal: 10)
//    }
//}
//
////Class MagicWand Initialization
//class MagicWand: HealWeapon {
//    init() {
//        super.init(damages: 0, heal: 7)
//    }
//}
