//
//  gameManager.swift
//  Project3
//
//  Created by Nicolas Lion on 14/10/2018.
//  Copyright © 2018 Nicolas Lion. All rights reserved.
//

class GameManager {
    
// Creation of the array which will contain the characters and their names, chosen by the player
    var charactersNames = [String]()
    
    var team1: [Character] = []
    var team2: [Character] = []
    
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
            + "\n3. The Colossus, resistant but does not do a lot of damage."
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
    


    func player1AllyChoice() -> Character {
        
        var playerChoice: Character
        
        if let choice = readLine() {
            if choice == "1" {
                playerChoice = team1[0]
            } else if choice == "2" {
                playerChoice = team1[1]
            } else if choice == "3" {
                playerChoice = team1[2]
            } else {
                print("Error")
                return player1AllyChoice()
            }
        }
        return playerChoice
    }
    

    
    func player1HealChoice() -> Character {
        var playerChoice: Character
        
        if let choice = readLine() {
            if choice == "1" {
                playerChoice = team1[0]
            } else if choice == "2" {
                playerChoice = team1[1]
            } else if choice == "3" {
                playerChoice = team1[2]
            } else {
                print("Error")
                return player1HealChoice()
            }
        }
        return playerChoice
    }
    
    func player1OpponentChoice() -> Character {
        var playerChoice: Character
        
        if let choice = readLine() {
            if choice == "1" {
                playerChoice = team2[0]
            } else if choice == "2" {
                playerChoice = team2[1]
            } else if choice == "3" {
                playerChoice = team2[2]
            } else {
                print("Error")
                return player1OpponentChoice()
            }
        }
        return playerChoice
    }
    
    func player2AllyChoice() -> Character {
        var playerChoice: Character
        
        if let choice = readLine() {
            if choice == "1" {
                playerChoice = team2[0]
            } else if choice == "2" {
                playerChoice = team2[1]
            } else if choice == "3" {
                playerChoice = team2[2]
            } else {
                print("Error")
                return player2AllyChoice()
            }
        }
        return playerChoice
    }
    
    func player2HealChoice() -> Character {
            var playerChoice: Character
            
            if let choice = readLine() {
                if choice == "1" {
                    playerChoice = team2[0]
                } else if choice == "2" {
                    playerChoice = team2[1]
                } else if choice == "3" {
                    playerChoice = team2[2]
                } else {
                    print("Error")
                    return player2HealChoice()
                }
            }
            return playerChoice
        }
    
    func player2OpponentChoice() -> Character {
        var playerChoice: Character
        
        if let choice = readLine() {
            if choice == "1" {
                playerChoice = team1[0]
            } else if choice == "2" {
                playerChoice = team1[1]
            } else if choice == "3" {
                playerChoice = team1[2]
            } else {
                print("Error")
                return player2OpponentChoice()
            }
        }
        return playerChoice
    }
    
// Functions that will be used to attack the opposing team
    
    func player1Attack(player1ALly: Character, player1Opponent: Character) {

        var indexTeam2 = team2.firstIndex(where: player1Opponent)
        
        player1Ally.attack(character: player1Opponent)
        resumeAttackActions(attackedCharacter: player1Opponent)
        if player1Opponent.life == 0 {
            team2.remove(at: indexTeam2)
            print("\(player1Opponent.characterName) The \(player1Opponent.type) is dead.")
        }  
    }
    
    func player2Attack(player2Ally: Character, player2Opponent: Character) {

        var indexTeam1 = team1.firstIndex(where: player2Opponent)
        
        player2Ally.attack(character: player2Opponent)
        resumeAttackActions(attackedCharacter: player2Opponent)
        if player2Opponent.life == 0 {
            team1.remove(at: indexTeam1)
            print("\(player2Opponent.characterName) The \(player2Opponent.type) is dead.")
        }
    
    }
    
// Functions that will serve to heal his own team
    
    func player1Heal(player1Ally: Character, player1Heal: Character) {
        
        player1Ally.heal(character: player1Heal)
        resumeHealActions(healedCharacter: player1Heal)
    }
    
    func player2Heal(player2Ally: Character, player2Heal: Character) {
        
        player2Ally.heal(character: player2Heal)
        resumeHealActions(healedCharacter: player2Heal)
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
        
        player1AllyChoice()
       var player1Character = player1AllyChoice()
        
        if player1Character == Magus() {
            print("Who do you want to heal ?")
            player1HealChoice()
            var player1CharacterForHeal = player1HealChoice()
            player1Heal(player1Ally: player1Character, player1Heal: player1CharacterForHeal)
        } else {
            print("Who do you want to attack ?")
            player1OpponentChoice()
            var player1CharacterOpponent = player1OpponentChoice()
            player1Attack(player1ALly: player1Character, player1Opponent: player1CharacterOpponent)
        }
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

        player2AllyChoice()
        var player2Character = player2AllyChoice()
        
        if player2Character == Magus() {
            print("Who do you want to heal ?")
            player2HealChoice()
            var player2CharacterForHeal = player2HealChoice()
            player2Heal(player2Ally: player2Character, player2Heal: player2CharacterForHeal)
        } else {
            print("Who do you want to attack ?")
            player2OpponentChoice()
            var player2CharacterOpponent = player2OpponentChoice()
            player2Attack(player2Ally: player2Character, player2Opponent: player2CharacterOpponent)
        }
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
    
// Function that will check if the character name already exist
    func checkIfNameExist() {
        var chosenName = ""

        
        if let name = readLine() {
            if charactersNames.contains(name) {
                repeat {
                    print("This name already exists, choose another.")
                    if let name = readLine() {
                        chosenName = name
                    }
                } while charactersNames.contains(chosenName)
                charactersNames.append(chosenName)
            }else {
                charactersNames.append(name)
            }
        }
    }
    
// Function for create a character
    func createCharacter() -> Character {
        teamSelectionMenu()
        
        if let type = readLine(),
        let characterRawValue = Int(type),
            let characterType = CharacterType(rawValue: characterRawValue) {
            
            print("What's his name ?")
            
            checkIfNameExist()
            let name = charactersNames.last
            let character = Character(characterName: name!, characterType: characterType)
            return character
            
        } else {
            print("Error !")
            return createCharacter()
        }
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
            let character = createCharacter()
            team1.append(character)

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
            let character = createCharacter()
            team2.append(character)
            
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



