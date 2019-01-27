//
//  gameManager.swift
//  Project3
//
//  Created by Nicolas Lion on 14/10/2018.
//  Copyright © 2018 Nicolas Lion. All rights reserved.
//

/// Class Game Manager Initialization, this class will contain the course of the game
class GameManager {
    

    // MARK: - Properties
    
    /// Variable for store the numbers of turn
    private var numbersOfTurn = 0
    
    /// Variable for store the number of chest found
    private var numberOfChest = 0
    
    /// Instance of class Weapon Factory
    private var weaponFactory = WeaponFactory()
    
    private var player = Player()

    // MARK: Public Functions
    
    /// Function to display the team selection menu
    func displayTeamSelectionMenu() {
        print("Choose the next member of your team :"
            + "\n1. The Warrior, the classic striker."
            + "\n2. The Magus, great healer."
            + "\n3. The Colossus, resistant but does not do a lot of damage."
            + "\n4. The Dwarf, does a lot of damage but is not very resistant.")
    }
    
    /// Function that will launch a new game
    func launchNewGame() {
        print("Do you want to play a new game ?")
        print("1. Yes.")
        print("2. No.")
        
        if let choice = readLine() {
            if choice == "1" {
                return playNewGame()
            } else if choice == "2" {
                print("Thanks for playing Warlords !")
            } else {
                print("Error")
                return launchNewGame()
            }
        }
    }
    
    /// Function for Initialize the game, team 1 and team 2
    func initGame() {
        welcome()
        
        player.player1Name = player.askPlayerName(whichPlayer: "One")
        player.team1 = player.createTeam()
        
        player.player2Name = player.askPlayerName(whichPlayer: "Two")
        player.team2 = player.createTeam()
        
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
            attacker = player.team1
            defender = player.team2
            attackerName = player.player1Name
            defenderName = player.player2Name
        } else {
            attacker = player.team2
            defender = player.team1
            attackerName = player.player2Name
            defenderName = player.player1Name
        }
        
        while isTeamAlive(team: player.team1) && isTeamAlive(team: player.team2) {
            playTurn(playerName: attackerName, opponentName: defenderName, teamTurn: attacker, opponentTeam: defender)
            swap(&attackerName, &defenderName)
            swap(&attacker, &defender)
        }
        
        
        if isTeamAlive(team: player.team1) == false {
            print("\(player.player2Name) is the Winner !")
        } else {
            print("\(player.player1Name) is the Winner !")
        }
        
        print("In this game, \(numbersOfTurn) turns were played, \(numberOfChest) chests were found and \(numberOfCriticalStrike) critical strike were inflicted.")
        
    }
    
    /// Function that will resume last heal actions
    func resumeHealActions(healedCharacter: Character) {
        print("\(healedCharacter.name) The \(healedCharacter.type) was healed.")
        print("\(healedCharacter.name) The \(healedCharacter.type) has now \(healedCharacter.life) life points.")
    }
    
    /// Function that will resume last attack actions
    func resumeAttackActions(attackedCharacter: Character) {
        print("\(attackedCharacter.name) The \(attackedCharacter.type) was attacked.")
        print("\(attackedCharacter.name) has now \(attackedCharacter.life) life points.")
    }
    
    // MARK: - Private Functions
    
    /// Function that will say Welcome !
    private func welcome() {
        print("Hello fighters, and welcome to Warlords !")
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
        let characterChoice = player.selectCharacter(team: teamTurn)
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
            
            let healedCharacter = player.selectCharacter(team: teamTurn)
            characterChoice.heal(healed: healedCharacter)
        } else {
            print("Who do you want to attack ?")
            displayTeam(team: opponentTeam)
            
            let attackedCharacter = player.selectCharacter(team: opponentTeam)
            characterChoice.attack(defender: attackedCharacter)
        }
        numbersOfTurn += 1
    }
    
    /// Function to know the player who will start
    private func chooseBeginner() -> Int {
        let randomNumber = Int.random(in: 1...2)
        if randomNumber == 1 {
            print("\(player.player1Name) won at head or tails.")
            print("\(player.player1Name) begin the game.")
        } else {
            print("\(player.player2Name) won at head or tails.")
            print("\(player.player2Name) begin the game.")
        }
        return randomNumber
    }
    
    /// Function to know if the team is alive
    private func isTeamAlive(team: [Character]) -> Bool {
        return team.contains(where: {character in character.life > 0 })
    }
    
    /// Function for playing new game
    private func playNewGame() {
        player.charactersNames.removeAll()
        numberOfChest = 0
        numbersOfTurn = 0
        numberOfCriticalStrike = 0
        
        initGame()
        playGame()
        launchNewGame()
    }
}



