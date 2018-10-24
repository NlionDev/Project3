//
//  main.swift
//  Project3
//
//  Created by Nicolas Lion on 14/10/2018.
//  Copyright © 2018 Nicolas Lion. All rights reserved.
//

// Class Character Initialization
class Character {
    var characterName: String
    var life = 0
    var strike = 0
    var magicPower = 0
    var weapons: String
    
    init (characterName: String, weapons: String){
        self.characterName = characterName
        self.weapons = weapons
        
        switch weapons {
        case "Sword":
            strike = 10
        case "Magic Stick":
            magicPower = 5
        case "Shield":
            strike = 5
        case "Axe":
            strike = 25
        default:
            strike = 0
            magicPower = 0
        }
    }
    
}


// Creating class Instances
var warrior = Character(characterName: "", weapons: "Sword")
warrior.life = 100


var magus = Character(characterName: "", weapons: "Magic Stick")
magus.life = 80


var colossus = Character(characterName: "", weapons: "Shield")
colossus.life = 150


var dwarf = Character(characterName: "", weapons: "Axe")
dwarf.life = 60


// Creation of the array which will contain the team chosen by the player
var team = [String: Character]()

// Function that will create the Warrior
func createWarrior() {
    if let name = readLine(){
        warrior.characterName = name
        team[name] = warrior
    }
}

// Function that will create the Magus
func createMagus() {
    if let name = readLine(){
        magus.characterName = name
        team[name] = magus
    }
}

// Fuction that will create the Colossus
func createColossus(){
    if let name = readLine(){
        colossus.characterName = name
        team[name] = colossus
    }
}

// Function that will create the Dwarf
func createDwarf(){
    if let name = readLine(){
        dwarf.characterName = name
        team[name] = dwarf
    }
}

// Functions to display the team selection menu
func teamSelectionMenu1(){
    print("Choose the first member of your team :"
        + "\n1. The Warrior, the classic striker."
        + "\n2. The Magus, great healer."
        + "\n3. The Colossus,resistant but does not do a lot of damage."
        + "\n4. The Dwarf, does a lot of damage but is not very resistant.")
}

func teamSelectionMenu2(){
    print("Choose the second member of your team :"
        + "\n1. The Warrior, the classic striker."
        + "\n2. The Magus, great healer."
        + "\n3. The Colossus,resistant but does not do a lot of damage."
        + "\n4. The Dwarf, does a lot of damage but is not very resistant.")
}

func teamSelectionMenu3(){
    print("Choose the last member of your team :"
        + "\n1. The Warrior, the classic striker."
        + "\n2. The Magus, great healer."
        + "\n3. The Colossus,resistant but does not do a lot of damage."
        + "\n4. The Dwarf, does a lot of damage but is not very resistant.")
}

// Function that will create the player's team
func createTeam() {
    
    teamSelectionMenu1()
    
    if let choice1 = readLine() {
        switch choice1 {
        case "1":
            print("You choose The Warior, what's his name ?")
            createWarrior()
            
        case "2":
            print("You choose The Magus, what's his name ?")
            createMagus()
            
        case "3":
            print("You choose The Colossus, what's his name ?")
            createColossus()
            
        case "4":
            print("You choose The Dwarf, what's his name ?")
            createDwarf()
            
        default:
            print("I don't understand.")
            teamSelectionMenu1()
        }
    }
    
    teamSelectionMenu2()
    
    if let choice2 = readLine() {
        switch choice2 {
        case "1":
            print("You choose The Warior, what's his name ?")
            createWarrior()
            
        case "2":
            print("You choose The Magus, what's his name ?")
            createMagus()
            
        case "3":
            print("You choose The Colossus, what's his name ?")
            createColossus()
            
        case "4":
            print("You choose The Dwarf, what's his name ?")
            createDwarf()
            
        default:
            print("I don't understand.")
            teamSelectionMenu2()
        }
    }
    
    teamSelectionMenu3()
    
    if let choice3 = readLine() {
        switch choice3 {
        case "1":
            print("You choose The Warior, what's his name ?")
            createWarrior()
            
        case "2":
            print("You choose The Magus, what's his name ?")
            createMagus()
            
        case "3":
            print("You choose The Colossus, what's his name ?")
            createColossus()
            
        case "4":
            print("You choose The Dwarf, what's his name ?")
            createDwarf()
            
        default:
            print("I don't understand.")
            teamSelectionMenu3()
        }
    }
    
}

createTeam()
