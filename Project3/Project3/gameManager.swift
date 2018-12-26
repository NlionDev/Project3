//
//  gameManager.swift
//  Project3
//
//  Created by Nicolas Lion on 14/10/2018.
//  Copyright © 2018 Nicolas Lion. All rights reserved.
//

/// Class Game Manager Initialization, this class will contain the course of the game
class GameManager {
    
    /// Array for store character's name
    private var charactersNames = [String]()
    
    /// Array for store characters of team 1
    private var team1: [Character] = []
    
    /// Array for store characters of team 2
    private var team2: [Character] = []
    
    /// Variable for store the numbers of turn
    private var numbersOfTurn = 0
    
    /// Variable for store the number of chest found
    private var numberOfChest = 0
    
    /// Instance of class Character Factory
    private var characterFactory = CharacterFactory()
    
    /// Instance of class Weapon Factory
    private var weaponFactory = WeaponFactory()
    
    /// Variables which will containe the player One's name
    private var player1Name = ""
    
    /// Variables which will containe the player Two's name
    private var player2Name = ""
    
    
    /// Function for Initialize the game, team 1 and team 2
    func initGame() {
        welcome()
        
        player1Name = askPlayerName(whichPlayer: "One")
        team1 = createTeam()
        
        player2Name = askPlayerName(whichPlayer: "Two")
        team2 = createTeam()
        
    }
    
    
    /// Function that will launch a new game
    func launchNewGame() {
        print("Do you want to play a new game ?")
        print("1. Yes.")
        print("2. No.")
        
        if let choice = readLine() {
            if choice == "1" {
                return playGame()
            } else if choice == "2" {
                print("Thanks for playing Warlords !")
            } else {
                print("Error")
                return launchNewGame()
            }
        }
    }
    
    ///Function for the unfolding of the party
    func playGame() {
        
        let headOrTails = chooseBeginner()
        
        /// Team that will attack for this round
        var attacker = [Character]()
        
        /// Team that will defend for this round
        var defender = [Character]()
        
        /// Name of the player who will attack for this turn
        var attackerName = ""
        
        /// Name of the player who will defend for this turn
        var defenderName = ""
        
        if headOrTails == 1 {
            attacker = team1
            defender = team2
            attackerName = player1Name
            defenderName = player2Name
        } else {
            attacker = team2
            defender = team1
            attackerName = player2Name
            defenderName = player1Name
        }
        
        while isTeamAlive(team: team1) && isTeamAlive(team: team2) {
            playTurn(playerName: attackerName, opponentName: defenderName, teamTurn: attacker, opponentTeam: defender)
            swap(&attackerName, &defenderName)
            swap(&attacker, &defender)
        }
        
        
        
        if team1.count == 0 {
            print("\(player2Name) is the Winner !")
        } else {
            print("\(player1Name) is the Winner !")
        }
        
        print("In this game, \(numbersOfTurn) turns were played, \(numberOfChest) chests were found and \(numberOfCriticalStrike) critical strike were inflicted.")
        
    }
    
    /// Function that will say Welcome !
    private func welcome() {
        print("Hello fighters, and welcome to Warlords !")
    }
    
    /// Function to display the team selection menu
    private func displayTeamSelectionMenu() {
        print("Choose the next member of your team :"
            + "\n1. The Warrior, the classic striker."
            + "\n2. The Magus, great healer."
            + "\n3. The Colossus, resistant but does not do a lot of damage."
            + "\n4. The Dwarf, does a lot of damage but is not very resistant.")
    }
    
    /// Function for select a character in the game
    private func selectCharacter(team: [Character]) -> Character {
        
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
    
    
    /// Functions that will be used to attack
    private func attack(attacker: Character, defender: Character) {
        attacker.attack(character: defender)
        resumeAttackActions(attackedCharacter: defender)
        if defender.life == 0 {
            print("\(defender.name) The \(defender.type) is dead.")
            defender.status = "is dead ☠️"
        }  
    }
    
    
    
    /// Functions that will serve to heal
    private func heal(healer: Character, healed: Character) {
        healer.heal(character: healed)
        resumeHealActions(healedCharacter: healed)
    }
    
    
    
    /// Function that display the name of the characters of the team
    private func displayTeam(team: [Character]) {
        for character in team {
            print("\(character.name) The \(character.type) has \(character.life) life points.")
        }
    }
    
    
    /// Function for players to choose their actions
    private func playTurn(playerName: String, opponentName: String, teamTurn: [Character], opponentTeam: [Character]) {
        
        print("\(playerName) it's your turn.")
        print("Here is your team :")
        displayTeam(team: teamTurn)
        print("Here is \(opponentName)'s team :")
        displayTeam(team: opponentTeam)
        print("Who do you choose :")
        for character in teamTurn {
            print("\(character.name) The \(character.type) \(character.status)")
        }
        let characterChoice = selectCharacter(team: teamTurn)
        let getRandomInt = Int.random(in: 1...3)
        let getRandomWeapon = Int.random(in: 1...9)
        
        if getRandomInt == 2 {
            print("Wow, a chest appears !")
            print("\(characterChoice.name) open the chest..")
            let weaponRawValue = getRandomWeapon
            let weaponType = WeaponFactory.Category(rawValue: weaponRawValue)
            
            let randomWeapon = weaponFactory.create(weaponType!)
            print("..and found a \(randomWeapon.name) !")
            
            if characterChoice.type == "Magus" && randomWeapon.isAttack == false {
                characterChoice.weapon = randomWeapon
                print("\(characterChoice.name) equips himself with \(randomWeapon.name)")
            } else if characterChoice.type == "Magus" && randomWeapon.isAttack == true {
                print("\(characterChoice.name) can not equips himself with \(randomWeapon.name)")
            } else if characterChoice.type != "Magus" && randomWeapon.isAttack == false {
                print("\(characterChoice.name) can not equips himself with \(randomWeapon.name)")
            } else {
                characterChoice.weapon = randomWeapon
                print("\(characterChoice.name) equips himself with \(randomWeapon.name)")
            }
            numberOfChest += 1
        }
        if characterChoice.type == "Magus" {
            print("Who do you want to heal ?")
            displayTeam(team: teamTurn)
            
            let healedCharacter = selectCharacter(team: teamTurn)
            heal(healer: characterChoice, healed: healedCharacter)
        } else {
            print("Who do you want to attack ?")
            displayTeam(team: opponentTeam)
            
            let attackedCharacter = selectCharacter(team: opponentTeam)
            attack(attacker: characterChoice, defender: attackedCharacter)
        }
        numbersOfTurn += 1
    }
    
    
    /// Function that will resume last heal actions
    private func resumeHealActions(healedCharacter: Character) {
        print("\(healedCharacter.name) The \(healedCharacter.type) was healed.")
        print("\(healedCharacter.name) The \(healedCharacter.type) has now \(healedCharacter.life) life points.")
    }
    
    /// Function that will resume last attack actions
    private func resumeAttackActions(attackedCharacter: Character) {
        print("\(attackedCharacter.name) The \(attackedCharacter.type) was attacked.")
        print("\(attackedCharacter.name) has now \(attackedCharacter.life) life points.")
    }
    
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
        displayTeamSelectionMenu()
        
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
    
    /// Function that will create the player's team
    private func createTeam() -> [Character] {
        
        var team = [Character]()
        
        print("You have to choose 3 characters.")
        
        for _ in 1...3 {
            let character = createCharacter()
            team.append(character)
        }
        return team
    }
    
    /// Function to ask the player his name
    private func askPlayerName(whichPlayer: String) -> String {
        print("Player \(whichPlayer), what's your name ?")
        
        var name = readLine()
        
        while name == nil {
            name = readLine()
        }
        return name!
    }
    
    /// Function to know the player who will start
    private func chooseBeginner() -> Int {
        let randomNumber = Int.random(in: 1...2)
        if randomNumber == 1 {
            print("\(player1Name) won at head or tails.")
            print("\(player1Name) begin the game.")
        } else {
            print("\(player2Name) won at head or tails.")
            print("\(player2Name) begin the game.")
        }
        return randomNumber
    }
    

    /// Function to know if the team is alive
    private func isTeamAlive(team: [Character]) -> Bool {
        return team.contains(where: {character in character.life > 0 })
    }
}



