//
//  weapons.swift
//  Project3
//
//  Created by Nicolas Lion on 14/10/2018.
//  Copyright © 2018 Nicolas Lion. All rights reserved.
//

//Class AttackWeapons initialization
class AttackWeapon {
    var damages: Int
    
    init(damages: Int) {
        self.damages = damages
    }
}

//Class HealWeapons initialization
class HealWeapon {
  var heal: Int
    
    init(heal: Int) {
        self.heal = heal
    }
}

//Class OneHandedSword Initialization
class OneHandedSword: AttackWeapon {
    init() {
        super.init(damages: 10)
    }
}

//Class TwoHandedSword Initialization
class TwoHandedSword: AttackWeapon {
    init() {
        super.init(damages: 15)
    }
}

//Class OneHandedMass Initialization
class OneHandedMass: AttackWeapon {
    init() {
        super.init(damages: 5)
    }
}

//Class TwoHandedMass Initialization
class TwoHandedMass: AttackWeapon {
    init() {
        super.init(damages: 12)
    }
}

//Class TwoHandedAxe Initialization
class TwoHandedAxe: AttackWeapon {
    init() {
        super.init(damages: 20)
    }
}

//Class MagicStick Initialisation
class MagicStick: HealWeapon {
    init() {
        super.init(heal: 10)
    }
}

//Class MagicWand Initialization
class MagicWand: HealWeapon {
    init() {
        super.init(heal: 7)
    }
}
