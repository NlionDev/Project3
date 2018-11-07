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
        return team1[0].life + team1[1].life + team1[2].life
    }

    var team2Life: Int {
        return team2[0].life + team2[1].life + team2[2].life
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
    func createCharacter(teamName: inout [String], classe: Character) -> Character {
        var chosenName = ""

            if let name = readLine() {
                if teamName.contains(name) {
                    repeat {
                        print("This name already exists, choose another.")
                        if let name = readLine() {
                            chosenName = name
                        }
                    } while teamName.contains(chosenName)
                    teamName.append(chosenName)
                }else {
                    teamName.append(name)
        }
   }
        return classe
}
    
// Function that will create the player's team
    func createTeam1() {
        print("Player One, what's your name ?")
        if let playerName = readLine(){
            player1Name = playerName
            print("Welcome to the batlle \(playerName) !")
        }
        
        print("You have to choose 3 characters.")
        
        for _ in 1...3 {
            
            var player1Choice = ""
            
             teamSelectionMenu()
            repeat {
            if let choice = readLine() {
                player1Choice = choice
                switch choice {
                case "1":
                    print("You choose The Warior, what's his name ?")
                    createCharacter(teamName: &team1Names, classe: Warrior())
                    team1.append(Warrior())
                case "2":
                    print("You choose The Magus, what's his name ?")
                    createCharacter(teamName: &team1Names, classe: Magus())
                    team1.append(Magus())
                case "3":
                    print("You choose The Colossus, what's his name ?")
                    createCharacter(teamName: &team1Names, classe: Colossus())
                    team1.append(Colossus())
                case "4":
                    print("You choose The Dwarf, what's his name ?")
                    createCharacter(teamName: &team1Names, classe: Dwarf())
                    team1.append(Dwarf())
                default:
                    print("I don't understand.")
                    teamSelectionMenu()
                }
            }
        } while player1Choice != "1" && player1Choice != "2" && player1Choice != "3" && player1Choice != "4"
    }
}
    
    // Function that will create the player's team
    func createTeam2() {
        print("Player Two, what's your name ?")
        if let playerName = readLine(){
            player2Name = playerName
            print("Welcome to the batlle \(playerName) !")
        }
        
           print("You have to choose 3 characters too.")
        
        
        for _ in 1...3 {
            var player2Choice = ""
            
            teamSelectionMenu()
            repeat {
                if let choice = readLine() {
                 player2Choice = choice
                    
                switch choice {
                case "1":
                    print("You choose The Warior, what's his name ?")
                    createCharacter(teamName: &team2Names, classe: Warrior())
                    team2.append(Warrior())
                case "2":
                    print("You choose The Magus, what's his name ?")
                    createCharacter(teamName: &team2Names, classe: Magus())
                    team2.append(Magus())
                case "3":
                    print("You choose The Colossus, what's his name ?")
                    createCharacter(teamName: &team2Names, classe: Colossus())
                    team2.append(Colossus())
                case "4":
                    print("You choose The Dwarf, what's his name ?")
                    createCharacter(teamName: &team2Names, classe: Dwarf())
                    team2.append(Dwarf())
                default:
                    print("I don't understand.")
                    teamSelectionMenu()
                }
            }
        } while player2Choice != "1" && player2Choice != "2" && player2Choice != "3" && player2Choice != "4"
    }
}
    
//Function for the unfolding of the party
    func playGame() {

        welcome()
        createTeam1()
        createTeam2()
        
        
//        while team1Life > 0 && team2Life > 0 {
//
//        }
        
        
}
    
    
}



