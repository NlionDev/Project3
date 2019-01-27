//
//  Player.swift
//  Project3
//
//  Created by Nicolas Lion on 27/01/2019.
//  Copyright © 2019 Nicolas Lion. All rights reserved.
//

class Player {
    
    // MARK: - Properties
    
    /// Array for store characters of team 1
    var team1: [Character] = []
    
    /// Array for store characters of team 2
    var team2: [Character] = []
    
    /// Variables which will containe the player One's name
    var player1Name = ""
    
    /// Variables which will containe the player Two's name
    var player2Name = ""
    
    /// Array for store character's name
    var charactersNames = [String]()
    
    /// Instance of class Character Factory
    private var characterFactory = CharacterFactory()
    
    // MARK: - Public Functions
    
    /// Function to ask the player his name
    func askPlayerName(whichPlayer: String) -> String {
        print("Player \(whichPlayer), what's your name ?")
        
        var name = readLine()
        
        while name == nil {
            name = readLine()
        }
        return name!
    }
    
    /// Function that will create the player's team
    func createTeam() -> [Character] {
        
        var team = [Character]()
        
        print("You have to choose 3 characters.")
        
        for _ in 1...3 {
            let character = createCharacter()
            team.append(character)
        }
        return team
    }
    
    /// Function for select a character in the game
    func selectCharacter(team: [Character]) -> Character {
        
        if let choice = readLine(),
            let index = Int(choice),
            index > 0,
            index <= team.count,
            team[index - 1].life > 0 {
            return team[index - 1]
        } else {
            print("Error")
            return selectCharacter(team: team)
        }
    }
    
    // MARK: - Private Functions
    
    /// Function that will create a unique name for characters
    private func getUniqueName() -> String {
        if var chosenName = readLine() {
            while charactersNames.contains(chosenName) {
                print("This name already exists, choose another.")
                if let name = readLine() {
                    chosenName = name
                }
            }
            charactersNames.append(chosenName)
            return chosenName
        } else {
            return getUniqueName()
        }
    }
    
    /// Function for create a character
    private func createCharacter() -> Character {
        gameManager.displayTeamSelectionMenu()
        
        if let type = readLine(),
            let characterRawValue = Int(type),
            let characterType = CharacterFactory.CharacterType(rawValue: characterRawValue) {
            
            print("What's his name ?")
            
            let name = getUniqueName()
            let character = characterFactory.create(characterType, name: name)
            return character
            
        } else {
            print("Error !")
            return createCharacter()
        }
    }
    
   
    
    
    
}
