//
//  weapons.swift
//  Project3
//
//  Created by Nicolas Lion on 14/10/2018.
//  Copyright © 2018 Nicolas Lion. All rights reserved.
//

////Class AttackWeapons initialization
//class AttackWeapon {
//    var damages: Int
//
//    init(damages: Int) {
//        self.damages = damages
//    }
//}
//
////Class HealWeapons initialization
//class HealWeapon {
//  var heal: Int
//
//    init(heal: Int) {
//        self.heal = heal
//    }
//}

class Weapon {
    var damages: Int
    var heal: Int
    
    init(damages: Int, heal: Int) {
        self.damages = damages
        self.heal = heal
    }
}

//Class OneHandedSword Initialization
class OneHandedSword: Weapon {
    init() {
        super.init(damages: 10, heal: 0)
    }
}

//Class TwoHandedSword Initialization
class TwoHandedSword: Weapon {
    init() {
        super.init(damages: 15, heal: 0)
    }
}

//Class OneHandedMass Initialization
class OneHandedMass: Weapon {
    init() {
        super.init(damages: 5, heal: 0)
    }
}

//Class TwoHandedMass Initialization
class TwoHandedMass: Weapon {
    init() {
        super.init(damages: 12, heal: 0)
    }
}

//Class TwoHandedAxe Initialization
class TwoHandedAxe: Weapon {
    init() {
        super.init(damages: 20, heal: 0)
    }
}

//Class MagicStick Initialisation
class MagicStick: Weapon {
    init() {
        super.init(damages: 0, heal: 10)
    }
}

//Class MagicWand Initialization
class MagicWand: Weapon {
    init() {
        super.init(damages: 0, heal: 7)
    }
}
