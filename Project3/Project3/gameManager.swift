//
//  gameManager.swift
//  Project3
//
//  Created by Nicolas Lion on 14/10/2018.
//  Copyright © 2018 Nicolas Lion. All rights reserved.
//

class GameManager {
    
// Creation of the array which will contain the team chosen by the player
    var team1Names = [String]()
    var team2Names = [String]()
    
    var team1 = [Character]()
    var team2 = [Character]()
    
    var teamCount = 3
    
//Variables containing the total health points of the team
    var team1Life: Int {
        return character1Team1.life + character2Team2.life + character3Team1.life
    }
    
    var team2Life: Int {
        return character1Team2.life + character2Team2.life + character3Team2.life
    }
    
// Creation of the variables which will containe the player's name
    var player1Name = ""
    var player2Name = ""
    
//// Variables containing the characters of the team 1
//    var character1Team1 = Character(characterName: "", life: 0)
//    var character2Team1 = Character(characterName: "", life: 0)
//    var character3Team1 = Character(characterName: "", life: 0)
//
//// Variables containing the characters of the team 2
//    var character1Team2 = Character(characterName: "", life: 0)
//    var character2Team2 = Character(characterName: "", life: 0)
//    var character3Team2 = Character(characterName: "", life: 0)
    
// Function that will say Welcome !
    func welcome() {
       print("Hello fighters, and welcome to Warlords !")
    }
    
    // Function to display the team selection menu
    func teamSelectionMenu() {
        print("Choose the next member of your team :"
            + "\n1. The Warrior, the classic striker."
            + "\n2. The Magus, great healer."
            + "\n3. The Colossus,resistant but does not do a lot of damage."
            + "\n4. The Dwarf, does a lot of damage but is not very resistant.")
    }
    

    
//// Function that display the name of the characters of the team
//    func displayTeam1() {
//        print("1. \(character1Team1.characterName) have \(character1Team1.life) life points")
//        print("2. \(character2Team1.characterName) have \(character2Team1.life) life points")
//        print("3. \(character3Team1.characterName) have \(character3Team1.life) life points")
//    }
//
//    func displayTeam2() {
//        print("1. \(character1Team2.characterName) have \(character1Team2.life) life points")
//        print("2. \(character2Team2.characterName) have \(character2Team2.life) life points")
//        print("3. \(character3Team2.characterName) have \(character3Team2.life) life points")
//    }
    
// // Function for players to choose their actions
//    func player1Turn() {
//        print("\(player1Name) it's your turn."
//            + "Here is your team :")
//        displayTeam1()
//        print("Here is your opponent's team :")
//        displayTeam2()
//        print("Who do you choose for attack or heal :"
//            + "1. \(character1Team1.characterName)"
//            + "2. \(character2Team1.characterName)"
//            + "3. \(character3Team1.characterName)")
//    }

    
//    func player2Turn() {
//        print("\(player2Name) it's your turn."
//            + "Here is your team :")
//        displayTeam2()
//        print("Here is your opponent's team :")
//        displayTeam1()
//        print("Who do you choose for attack or heal :"
//            + "1. \(character1Team2.characterName)"
//            + "2. \(character2Team2.characterName)"
//            + "3. \(character3Team2.characterName)")
//    }
    
// Function that will resume last actions
    func resumeActions() {
        
    }
    
// Function for create a character
    func createCharacter(teamName: inout [String], classe: Character, team: inout [Character]) -> Character {
        if let name = readLine() {
            if teamName.contains(name) {
                print("This name already exists, choose another.")
            } else {
                teamName.append(name)
            }
        }
        team.append(classe)
        return classe
    }
    
// Function that will create the player's team
    func createTeam(playerNames: String, teamNames: inout [String], teams: inout [Character], player: String){
        print("Player \(player), what's your name ?")
        if let playerName = readLine(){
            playerNames = playerName
            print("Welcome to the batlle \(playerNames) !")
        }
        
        for i in 1...3 {
            
             teamSelectionMenu()
            if let choice = readLine() {
                switch choice {
                case "1":
                    print("You choose The Warior, what's his name ?")
                    createCharacter(teamName: &teamNames, classe: Warrior(), team: &teams)
                    
                case "2":
                    print("You choose The Magus, what's his name ?")
                    createCharacter(teamName: &teamNames, classe: Magus(), team: &teams)
                    
                case "3":
                    print("You choose The Colossus, what's his name ?")
                    createCharacter(teamName: &teamNames, classe: Colossus(), team: &teams)
                    
                case "4":
                    print("You choose The Dwarf, what's his name ?")
                    createCharacter(teamName: &teamNames, classe: Dwarf(), team: &teams)
                    
                default:
                    print("I don't understand.")
                    teamSelectionMenu()
                }
            }
        }
    }
    

    
////Function for the unfolding of the party
//    func playGame() {
//
//
//        while team1Life > 0 && team2Life > 0 {
//
//           }
//
}


