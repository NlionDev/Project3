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
    
    init (characterName: String){
        self.characterName = characterName
        
    }
    
}

// Class Weapons Initialization
class AttackWeapons {
    var strike = 0
    
}

class HealWeapons {
    var heal = 0
}


// Creating class Character Instances
var warrior = Character(characterName: "")
warrior.life = 100


var magus = Character(characterName: "")
magus.life = 80


var colossus = Character(characterName: "")
colossus.life = 125


var dwarf = Character(characterName: "")
dwarf.life = 60

// Creating Class AttackWeapons Instances
var twoHandedSword = AttackWeapons()
twoHandedSword.strike = 15

var twoHandedAxe = AttackWeapons()
twoHandedAxe.strike = 20

var oneHandedMass = AttackWeapons()
oneHandedMass.strike = 5

var twoHandedStick = HealWeapons()
twoHandedStick.heal = 8

var magicWand = HealWeapons()
magicWand.heal = 5

var oneHandedSword = AttackWeapons()
oneHandedSword.strike = 10

var twoHandedMass = AttackWeapons()
twoHandedMass.strike = 12



// Creation of the dictionary which will contain the team chosen by the player
var team1 = [String]()
var team2 = [String]()

// is Character's name unique name ?
var uniqueName = ""
var isItUniqueName = false


// Creation of the variables which will containe the player's name
var player1Name = ""
var player2Name = ""

// Functions that will create the Warrior
func createWarriorTeam1(){
    if let name = readLine(){
        warrior.characterName = name
        team1.append(name)
    }
}

func createWarriorTeam2(){
    if let name = readLine(){
        warrior.characterName = name
        team2.append(name)
    }
}

// Function that will create the Magus
func createMagusTeam1(){
    if let name = readLine(){
        magus.characterName = name
        team1.append(name)
    }
}

func createMagusTeam2(){
    if let name = readLine(){
        magus.characterName = name
        team2.append(name)
    }
}

// Fuction that will create the Colossus
func createColossusTeam1(){
    if let name = readLine(){
        colossus.characterName = name
        team1.append(name)
    }
}

func createColossusTeam2(){
    if let name = readLine(){
        colossus.characterName = name
        team2.append(name)
    }
}

// Function that will create the Dwarf
func createDwarfTeam1(){
    if let name = readLine(){
        dwarf.characterName = name
        team1.append(name)
    }
}

func createDwarfTeam2(){
    if let name = readLine(){
        dwarf.characterName = name
        team2.append(name)
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

// Function that will create the player one's team
func createTeam1() {
    
    print("Player One, what's your name ?")
    if let playerName = readLine(){
        player1Name = playerName
        print("Welcome to the batlle \(player1Name) !")
    }
    
    teamSelectionMenu1()
    
    if let choice1 = readLine() {
        switch choice1 {
        case "1":
            print("You choose The Warior, what's his name ?")
            createWarriorTeam1()
            
        case "2":
            print("You choose The Magus, what's his name ?")
            createMagusTeam1()
            
        case "3":
            print("You choose The Colossus, what's his name ?")
            createColossusTeam1()
            
        case "4":
            print("You choose The Dwarf, what's his name ?")
            createDwarfTeam1()
            
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
            createWarriorTeam1()
            
        case "2":
            print("You choose The Magus, what's his name ?")
            createMagusTeam1()
            
        case "3":
            print("You choose The Colossus, what's his name ?")
            createColossusTeam1()
            
        case "4":
            print("You choose The Dwarf, what's his name ?")
            createDwarfTeam1()
            
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
            createWarriorTeam1()
            
        case "2":
            print("You choose The Magus, what's his name ?")
            createMagusTeam1()
            
        case "3":
            print("You choose The Colossus, what's his name ?")
            createColossusTeam1()
            
        case "4":
            print("You choose The Dwarf, what's his name ?")
            createDwarfTeam1()
            
        default:
            print("I don't understand.")
            teamSelectionMenu3()
        }
    }
    
}

func createTeam2(){
    print("Player Two, what's your name ?")
    if let playerName = readLine(){
        player2Name = playerName
        print("Welcome to the batlle \(player2Name) !")
    }
    
    teamSelectionMenu1()
    
    if let choice1 = readLine() {
        switch choice1 {
        case "1":
            print("You choose The Warior, what's his name ?")
            createWarriorTeam2()
            
        case "2":
            print("You choose The Magus, what's his name ?")
            createMagusTeam2()
            
        case "3":
            print("You choose The Colossus, what's his name ?")
            createColossusTeam2()
            
        case "4":
            print("You choose The Dwarf, what's his name ?")
            createDwarfTeam2()
            
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
            createWarriorTeam2()
            
        case "2":
            print("You choose The Magus, what's his name ?")
            createMagusTeam2()
            
        case "3":
            print("You choose The Colossus, what's his name ?")
            createColossusTeam2()
            
        case "4":
            print("You choose The Dwarf, what's his name ?")
            createDwarfTeam2()
            
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
            createWarriorTeam2()
            
        case "2":
            print("You choose The Magus, what's his name ?")
            createMagusTeam2()
            
        case "3":
            print("You choose The Colossus, what's his name ?")
            createColossusTeam2()
            
        case "4":
            print("You choose The Dwarf, what's his name ?")
            createDwarfTeam2()
            
        default:
            print("I don't understand.")
            teamSelectionMenu3()
        }
    }
}
print("Hello fighters, and welcome to Warlords !")

createTeam1()
createTeam2()
