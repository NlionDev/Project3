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
    
    init(damages: Int, heal: Int) {
        self.damages = damages
        self.heal = heal
    }
}

//Class AttackWeapons initialization
class AttackWeapon: Weapon {
 
}

//Class HealWeapons initialization
class HealWeapon: Weapon {

    }



//Class OneHandedSword Initialization
class OneHandedSword: AttackWeapon {
    init() {
        super.init(damages: 10, heal: 0)
    }
}

//Class TwoHandedSword Initialization
class TwoHandedSword: AttackWeapon {
    init() {
        super.init(damages: 15, heal: 0)
    }
}

//Class OneHandedMass Initialization
class OneHandedMass: AttackWeapon {
    init() {
        super.init(damages: 5, heal: 0)
    }
}

//Class TwoHandedMass Initialization
class TwoHandedMass: AttackWeapon {
    init() {
        super.init(damages: 12, heal: 0)
    }
}

//Class TwoHandedAxe Initialization
class TwoHandedAxe: AttackWeapon {
    init() {
        super.init(damages: 20, heal: 0)
    }
}

//Class MagicStick Initialisation
class MagicStick: HealWeapon {
    init() {
        super.init(damages: 0, heal: 10)
    }
}

//Class MagicWand Initialization
class MagicWand: HealWeapon {
    init() {
        super.init(damages: 0, heal: 7)
    }
}
