//
//  weapons.swift
//  Project3
//
//  Created by Nicolas Lion on 14/10/2018.
//  Copyright © 2018 Nicolas Lion. All rights reserved.
//

//Class AttackWeapons initialization
class AttackWeapons {
    private var damages: Int
    
    init(damages: Int) {
        self.damages = damages
    }
}

//Class HealWeapons initialization
class HealWeapons {
    private var heal: Int
    
    init(heal: Int) {
        self.heal = heal
    }
}

//Class OneHandedSword Initialization
class OneHandedSword: AttackWeapons {
    init() {
        super.init(damages: 10)
    }
}

//Class TwoHandedSword Initialization
class TwoHandedSword: AttackWeapons {
    init() {
        super.init(damages: 15)
    }
}

//Class OneHandedMass Initialization
class OneHandedMass: AttackWeapons {
    init() {
        super.init(damages: 5)
    }
}

//Class TwoHandedMass Initialization
class TwoHandedMass: AttackWeapons {
    init() {
        super.init(damages: 12)
    }
}

//Class TwoHandedAxe Initialization
class TwoHandedAxe: AttackWeapons {
    init() {
        super.init(damages: 20)
    }
}

//Class MagicStick Initialisation
class MagicStick: HealWeapons {
    init() {
        super.init(heal: 10)
    }
}

//Class MagicWand Initialization
class MagicWand: HealWeapons {
    init() {
        super.init(heal: 7)
    }
}
