//
//  gameManager.swift
//  Project3
//
//  Created by Nicolas Lion on 14/10/2018.
//  Copyright © 2018 Nicolas Lion. All rights reserved.
//

class GameManager {
    
    // Function that will say Welcome !
    func welcome() {
       print("Hello fighters, and welcome to Warlords !")
    }
    
    // Function to display the team selection menu
    func teamSelectionMenu(member: String) {
        print("Choose the \(member) member of your team :"
            + "\n1. The Warrior, the classic striker."
            + "\n2. The Magus, great healer."
            + "\n3. The Colossus,resistant but does not do a lot of damage."
            + "\n4. The Dwarf, does a lot of damage but is not very resistant."
            + "\n5. The Warlock, the black magician who scares the enemies.")
    }
    
    
    // Function that will create the characters
    func createCharacter(classe: Character, team: inout[String]) {
        
        if let name = readLine(){
            if team.contains(name) {
                print("This name already exists, choose another.")
            } else {
                classe.characterName = name
                team.append(name)
            }
        }
    }
    
    // Function that display the name of the characters of the team
    func displayTeam(team: inout [String]) {
        for characters in team {
            print(characters)
        }
    }
    
    // Function that will create the player1's team
    func createTeam1(){
        print("Player One, what's your name ?")
        if let playerName = readLine(){
            player1Name = playerName
            print("Welcome to the batlle \(player1Name) !")
        }
        
        teamSelectionMenu(member: "first")
        
        if let choice1 = readLine() {
            switch choice1 {
            case "1":
                print("You choose The Warior, what's his name ?")
                createCharacter(classe: warrior1, team: &team1)
                
            case "2":
                print("You choose The Magus, what's his name ?")
                createCharacter(classe: magus1, team: &team1)
                
            case "3":
                print("You choose The Colossus, what's his name ?")
                createCharacter(classe: colossus1, team: &team1)
                
            case "4":
                print("You choose The Dwarf, what's his name ?")
                createCharacter(classe: dwarf1, team: &team1)
                
            case "5":
                print("You Choose The Warlock, what's his name ?")
                createCharacter(classe: warlock1, team: &team1)
                
            default:
                print("I don't understand.")
                teamSelectionMenu(member: "first")
            }
        }
        
        teamSelectionMenu(member: "second")
        
        if let choice2 = readLine() {
            switch choice2 {
            case "1":
                print("You choose The Warior, what's his name ?")
                createCharacter(classe: warrior1, team: &team1)
                
            case "2":
                print("You choose The Magus, what's his name ?")
                createCharacter(classe: magus1, team: &team1)
                
            case "3":
                print("You choose The Colossus, what's his name ?")
                createCharacter(classe: colossus1, team: &team1)
                
            case "4":
                print("You choose The Dwarf, what's his name ?")
                createCharacter(classe: dwarf1, team: &team1)
                
            case "5":
                print("You Choose The Warlock, what's his name ?")
                createCharacter(classe: warlock1, team: &team1)
                
            default:
                print("I don't understand.")
                teamSelectionMenu(member: "second")
            }
        }
        
        teamSelectionMenu(member: "last")
        
        if let choice3 = readLine() {
            switch choice3 {
            case "1":
                print("You choose The Warior, what's his name ?")
                createCharacter(classe: warrior1, team: &team1)
                
            case "2":
                print("You choose The Magus, what's his name ?")
                createCharacter(classe: magus1, team: &team1)
                
            case "3":
                print("You choose The Colossus, what's his name ?")
                createCharacter(classe: colossus1, team: &team1)
                
            case "4":
                print("You choose The Dwarf, what's his name ?")
                createCharacter(classe: dwarf1, team: &team1)
                
            case "5":
                print("You Choose The Warlock, what's his name ?")
                createCharacter(classe: warlock1, team: &team1)
                
            default:
                print("I don't understand.")
                teamSelectionMenu(member: "last")
            }
        }
    }
    
    //Function that will create player2's team
    func createTeam2() {
        print("Player Two, what's your name ?")
        if let playerName = readLine(){
            player2Name = playerName
            print("Welcome to the batlle \(player2Name) !")
        }
        
        teamSelectionMenu(member: "first")
        
        if let choice1 = readLine() {
            switch choice1 {
            case "1":
                print("You choose The Warior, what's his name ?")
                createCharacter(classe: warrior2, team: &team2)
                
            case "2":
                print("You choose The Magus, what's his name ?")
                createCharacter(classe: magus2, team: &team2)
                
            case "3":
                print("You choose The Colossus, what's his name ?")
                createCharacter(classe: colossus2, team: &team2)
                
            case "4":
                print("You choose The Dwarf, what's his name ?")
                createCharacter(classe: dwarf2, team: &team2)
                
            case "5":
                print("You Choose The Warlock, what's his name ?")
                createCharacter(classe: warlock2, team: &team2)
                
            default:
                print("I don't understand.")
                teamSelectionMenu(member: "first")
            }
        }
        
        teamSelectionMenu(member: "second")
        
        if let choice2 = readLine() {
            switch choice2 {
            case "1":
                print("You choose The Warior, what's his name ?")
                createCharacter(classe: warrior2, team: &team2)
                
            case "2":
                print("You choose The Magus, what's his name ?")
                createCharacter(classe: magus2, team: &team2)
                
            case "3":
                print("You choose The Colossus, what's his name ?")
                createCharacter(classe: colossus2, team: &team2)
                
            case "4":
                print("You choose The Dwarf, what's his name ?")
                createCharacter(classe: dwarf2, team: &team2)
                
            case "5":
                print("You Choose The Warlock, what's his name ?")
                createCharacter(classe: warlock2, team: &team2)
                
            default:
                print("I don't understand.")
                teamSelectionMenu(member: "second")
            }
        }
        
        teamSelectionMenu(member: "last")
        
        if let choice3 = readLine() {
            switch choice3 {
            case "1":
                print("You choose The Warior, what's his name ?")
                createCharacter(classe: warrior2, team: &team2)
                
            case "2":
                print("You choose The Magus, what's his name ?")
                createCharacter(classe: magus2, team: &team2)
                
            case "3":
                print("You choose The Colossus, what's his name ?")
                createCharacter(classe: colossus2, team: &team2)
                
            case "4":
                print("You choose The Dwarf, what's his name ?")
                createCharacter(classe: dwarf2, team: &team2)
                
            case "5":
                print("You Choose The Warlock, what's his name ?")
                createCharacter(classe: warlock2, team: &team2)
                
            default:
                print("I don't understand.")
                teamSelectionMenu(member: "last")
            }
        }
    }

    
}
