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
 
//
    enum Action {
        case Magus
        case Others
        
        var action: String {
            switch self {
            case .Magus: return "Who do you want to heal ?"
            case .Others:  return "Who do you want to attack ?"
            }
        }
    }
    

    
// Functions that will ask players what they want to do
    func player1Choice() {
        var player1Choice = ""
        
        if let choice = readLine() {
            player1Choice = choice
            repeat {
                
            
            switch choice {
            case "1":
                if team1[0].type == "Magus" {
                    Action.Magus.action
                    displayTeam1()
                    player1Heal(healer: team1[0])
                    
                } else {
                    Action.Others.action
                    displayTeam2()
                    player1Attack(attacker: team1[0])
                }
            case "2":
                if team1[1].type == "Magus" {
                    Action.Magus.action
                    displayTeam1()
                    player1Heal(healer: team1[1])
                    
                } else {
                    Action.Others.action
                    displayTeam2()
                    player1Attack(attacker: team1[1])
                }
            case "3":
                if team1[2].type == "Magus" {
                    Action.Magus.action
                    displayTeam1()
                    player1Heal(healer: team1[2])
                    
                } else {
                    Action.Others.action
                    displayTeam2()
                    player1Attack(attacker: team1[2])
                }
            default:
                print("Who do you choose :")
                for character in team1 {
                    print("\(character.characterName) The \(character.type)")
                }
            }
            } while player1Choice != "1" && player1Choice != "2" && player1Choice != "3"
        }
    }
    
    
    func player2Choice() {
        var player2Choice = ""
        
        
        if let choice = readLine() {
            player2Choice = choice
            repeat {
            switch choice {
            case "1":
                if team2[0].type == "Magus" {
                    Action.Magus.action
                    displayTeam2()
                    player2Heal(healer: team2[0])
                    
                } else {
                    Action.Others.action
                    displayTeam1()
                    player2Attack(attacker: team2[0])
                }
            case "2":
                if team2[1].type == "Magus" {
                    Action.Magus.action
                    displayTeam2()
                    player2Heal(healer: team2[1])
                    
                } else {
                    Action.Others.action
                    displayTeam1()
                    player2Attack(attacker: team2[1])
                }
            case "3":
                if team2[2].type == "Magus" {
                    Action.Magus.action
                    displayTeam2()
                    player2Heal(healer: team2[2])
                    
                } else {
                    Action.Others.action
                    displayTeam1()
                    player2Attack(attacker: team2[2])
                }
            default:
                print("Who do you choose :")
                for character in team2 {
                    print("\(character.characterName) The \(character.type)")
                }
            }
        } while player2Choice != "1" && player2Choice != "2" && player2Choice != "3"
        }
    }
    
// Functions that will be used to attack the opposing team
    
    func player1Attack(attacker: Character) {
        var player1Choice = ""
        
        if let choice = readLine() {
            player1Choice = choice
            repeat {
                
                
                switch choice {
                case "1":
                    attacker.attack(character: team2[0])
                    resumeAttackActions(attackedCharacter: team2[0])
                    if team2[0].life == 0 {
                        team2.remove(at: 0)
                         print("\(team2[0].characterName) The \(team2[0].type) is dead.")
                    }
                    
                case "2":
                     attacker.attack(character: team2[1])
                    resumeAttackActions(attackedCharacter: team2[1])
                     if team2[1].life == 0 {
                        team2.remove(at: 1)
                         print("\(team2[1].characterName) The \(team2[1].type) is dead.")
                    }
                    
                case "3":
                     attacker.attack(character: team2[2])
                    resumeAttackActions(attackedCharacter: team2[2])
                     if team2[2].life == 0 {
                        team2.remove(at: 2)
                         print("\(team2[2].characterName) The \(team2[2].type) is dead.")
                    }
                    
                default:
                    print("Who do you want to attack :")
                    for character in team2 {
                        print("\(character.characterName) The \(character.type)")
                    }
                }
            } while player1Choice != "1" && player1Choice != "2" && player1Choice != "3"
        }
    }
    
    func player2Attack(attacker: Character) {
        var player2Choice = ""
        
        if let choice = readLine() {
            player2Choice = choice
            repeat {
                
                
                switch choice {
                case "1":
                    attacker.attack(character: team1[0])
                    resumeAttackActions(attackedCharacter: team1[0])
                    if team1[0].life == 0 {
                        team1.remove(at: 0)
                         print("\(team1[0].characterName) The \(team1[0].type) is dead.")
                    }
                    
                case "2":
                    attacker.attack(character: team1[1])
                    resumeAttackActions(attackedCharacter: team1[1])
                    if team1[1].life == 0 {
                        team1.remove(at: 1)
                        print("\(team1[1].characterName) The \(team1[1].type) is dead.")
                    }
                
                case "3":
                    attacker.attack(character: team1[2])
                    resumeAttackActions(attackedCharacter: team1[2])
                    if team1[2].life == 0 {
                        team1.remove(at: 2)
                         print("\(team1[2].characterName) The \(team1[2].type) is dead.")
                    }
                    
                default:
                    print("Who do you want to attack :")
                    for character in team1 {
                        print("\(character.characterName) The \(character.type)")
                    }
                }
            } while player2Choice != "1" && player2Choice != "2" && player2Choice != "3"
        }
    }
    
    
// Functions that will serve to heal his own team
    
    func player1Heal(healer: Character) {
        
        var player1Choice = ""
        
        if let choice = readLine() {
            player1Choice = choice
            repeat {
                
                
                switch choice {
                case "1":
                    healer.heal(character: team1[0])
                    resumeHealActions(healedCharacter: team1[0])
                    
                case "2":
                    healer.heal(character: team1[1])
                    resumeHealActions(healedCharacter: team1[1])
                    
                case "3":
                    healer.heal(character: team1[2])
                    resumeHealActions(healedCharacter: team1[2])
                    
                default:
                    print("Who do you want to heal :")
                    for character in team1 {
                        print("\(character.characterName) The \(character.type)")
                    }
                }
            } while player1Choice != "1" && player1Choice != "2" && player1Choice != "3"
        }
    }
    
    func player2Heal(healer: Character) {
        var player2Choice = ""
        
        if let choice = readLine() {
            player2Choice = choice
            repeat {
                
                
                switch choice {
                case "1":
                   healer.heal(character: team2[0])
                    resumeHealActions(healedCharacter: team2[0])
                    
                case "2":
                    healer.heal(character: team2[1])
                    resumeHealActions(healedCharacter: team2[1])
                    
                case "3":
                    healer.heal(character: team2[2])
                    resumeHealActions(healedCharacter: team2[2])
                    
                default:
                    print("Who do you want to heal :")
                    for character in team2 {
                        print("\(character.characterName) The \(character.type)")
                    }
                }
            } while player2Choice != "1" && player2Choice != "2" && player2Choice != "3"
        }
    }
    
// Function that display the name of the characters of the team
    func displayTeam1() {
        for character in team1 {
            print("\(character.characterName) The \(character.type) has \(character.life) life points.")
        }
    }

    func displayTeam2() {
        for character in team2 {
            print("\(character.characterName) The \(character.type) has \(character.life) life points.")
        }
    }
    
 // Function for players to choose their actions
    func player1Turn() {
        
        print("\(player1Name) it's your turn.")
        print("Here is your team :")
        displayTeam1()
        print("Here is your opponent's team :")
        displayTeam2()
        print("Who do you choose :")
        for character in team1 {
            print("\(character.characterName) The \(character.type)")
        }
        
        player1Choice()
    }

    
    func player2Turn() {
        print("\(player2Name) it's your turn.")
        print("Here is your team :")
        displayTeam2()
        print("Here is your opponent's team :")
        displayTeam1()
        print("Who do you choose :")
        for character in team2 {
            print("\(character.characterName) The \(character.type)")
        }

        player2Choice()
    }
    


    
// Function that will resume last actions
    func resumeHealActions(healedCharacter: Character) {
      print("\(healedCharacter.characterName) The \(healedCharacter.type) was healed.")
        print("\(healedCharacter.characterName) The \(healedCharacter.type) has now \(healedCharacter.life) life points.")
    }
    
    func resumeAttackActions(attackedCharacter: Character) {
        print("\(attackedCharacter.characterName) The \(attackedCharacter.type) was attacked.")
        print("\(attackedCharacter.characterName) has now \(attackedCharacter.life) life points.")
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

        while team1Life > 0 && team2Life > 0 {
            
            player1Turn()
            player2Turn()

        }
        
        
}
    
    
}



