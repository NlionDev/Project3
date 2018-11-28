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
    
    var numbersOfTurn = 0
    var numberOfChest = 0
    
    var characterFactory = CharacterFactory()
    var weaponFactory = WeaponFactory()
    
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
 
    
    func player1AllyChoice() -> Character {
        
        var playerChoice: Character?
        
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
        return playerChoice!
    }
    
    func player1HealChoice() -> Character {
        var playerChoice: Character?
        
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
        return playerChoice!
    }
    
    func player1OpponentChoice() -> Character {
        var playerChoice: Character?
        
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
        return playerChoice!
    }
    
    func player2AllyChoice() -> Character {
        var playerChoice: Character?
        
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
        return playerChoice!
    }
    
    func player2HealChoice() -> Character {
        var playerChoice: Character?
        
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
        return playerChoice!
    }
    
    func player2OpponentChoice() -> Character {
        var playerChoice: Character?
        
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
        return playerChoice!
    }
    
    // Functions that will be used to attack the opposing team
    
    func player1Attack(player1Ally: Character, player1Opponent: Character) {
        
        guard let indexTeam2 = team2.firstIndex(where: { character in character.name == player1Opponent.name }) else {
            return
        }
        
        player1Ally.attack(character: player1Opponent)
        resumeAttackActions(attackedCharacter: player1Opponent)
        if player1Opponent.life == 0 {
            team2.remove(at: indexTeam2)
            print("\(player1Opponent.name) The \(player1Opponent.type) is dead.")
        }  
    }
    
    func player2Attack(player2Ally: Character, player2Opponent: Character) {
        
        guard let indexTeam1 = team1.firstIndex(where: { character in character.name == player2Opponent.name }) else {
            return
        }
        
        player2Ally.attack(character: player2Opponent)
        resumeAttackActions(attackedCharacter: player2Opponent)
        if player2Opponent.life == 0 {
            team1.remove(at: indexTeam1)
            print("\(player2Opponent.name) The \(player2Opponent.type) is dead.")
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
            print("\(character.name) The \(character.type) has \(character.life) life points.")
        }
    }
    
    func displayTeam2() {
        for character in team2 {
            print("\(character.name) The \(character.type) has \(character.life) life points.")
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
            print("\(character.name) The \(character.type)")
        }
        
        let player1Character = player1AllyChoice()
        
        let getRandomInt = Int.random(in: 1...3)
        let getRandomWeapon = Int.random(in: 1...9)
        
        if getRandomInt == 2 {
            print("Wow, a chest appears !")
            print("\(player1Character.name) open the chest..")
            let weaponRawValue = getRandomWeapon
            let weaponType = WeaponFactory.Category(rawValue: weaponRawValue)
            
            let randomWeapon = weaponFactory.create(weaponType!)
            print("..and found a \(randomWeapon.name) !")
            
            if player1Character.type == "Magus" && randomWeapon.isAttack == false {
                player1Character.weapon = randomWeapon
                print("\(player1Character.name) equips himself with \(randomWeapon.name)")
            } else if player1Character.type == "Magus" && randomWeapon.isAttack == true {
                print("\(player1Character.name) can not equips himself with \(randomWeapon.name)")
            } else if player1Character.type != "Magus" && randomWeapon.isAttack == false {
                print("\(player1Character.name) can not equips himself with \(randomWeapon.name)")
            } else {
                player1Character.weapon = randomWeapon
                print("\(player1Character.name) equips himself with \(randomWeapon.name)")
            }
            numberOfChest += 1
        }
        
        
        if player1Character.type == "Magus" {
            print("Who do you want to heal ?")
            displayTeam1()
            
            let player1CharacterForHeal = player1HealChoice()
            player1Heal(player1Ally: player1Character, player1Heal: player1CharacterForHeal)
        } else {
            print("Who do you want to attack ?")
            displayTeam2()
            
            let player1CharacterOpponent = player1OpponentChoice()
            player1Attack(player1Ally: player1Character, player1Opponent: player1CharacterOpponent)
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
            print("\(character.name) The \(character.type)")
        }
        
        
        let player2Character = player2AllyChoice()
        
        let getRandomInt = Int.random(in: 1...3)
        let getRandomWeapon = Int.random(in: 1...9)
        
        if getRandomInt == 2 {
            print("Wow, a chest appears !")
            print("\(player2Character.name) open the chest..")
            let weaponRawValue = getRandomWeapon
            let weaponType = WeaponFactory.Category(rawValue: weaponRawValue)
            
            let randomWeapon = weaponFactory.create(weaponType!)
            print("..and found a \(randomWeapon.name) !")
            
            if player2Character.type == "Magus" && randomWeapon.isAttack == false {
                player2Character.weapon = randomWeapon
                print("\(player2Character.name) equips himself with \(randomWeapon.name)")
            } else if player2Character.type == "Magus" && randomWeapon.isAttack == true {
                print("\(player2Character.name) can not equips himself with \(randomWeapon.name)")
            } else if player2Character.type != "Magus" && randomWeapon.isAttack == false {
                print("\(player2Character.name) can not equips himself with \(randomWeapon.name)")
            } else {
                player2Character.weapon = randomWeapon
                print("\(player2Character.name) equips himself with \(randomWeapon.name)")
            }
            numberOfChest += 1
        }
        
        if player2Character.type == "Magus" {
            print("Who do you want to heal ?")
            displayTeam2()
            
            let player2CharacterForHeal = player2HealChoice()
            player2Heal(player2Ally: player2Character, player2Heal: player2CharacterForHeal)
        } else {
            print("Who do you want to attack ?")
            displayTeam1()
            
            let player2CharacterOpponent = player2OpponentChoice()
            player2Attack(player2Ally: player2Character, player2Opponent: player2CharacterOpponent)
        }
        numbersOfTurn += 1
    }
    
    // Function that will resume last actions
    func resumeHealActions(healedCharacter: Character) {
        print("\(healedCharacter.name) The \(healedCharacter.type) was healed.")
        print("\(healedCharacter.name) The \(healedCharacter.type) has now \(healedCharacter.life) life points.")
    }
    
    func resumeAttackActions(attackedCharacter: Character) {
        print("\(attackedCharacter.name) The \(attackedCharacter.type) was attacked.")
        print("\(attackedCharacter.name) has now \(attackedCharacter.life) life points.")
    }
    
    // Function that will create a unique name for characters
    func getUniqueName() -> String {
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
    
    // Function for create a character
    func createCharacter() -> Character {
        teamSelectionMenu()
        
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
        
        while !team1.isEmpty || !team2.isEmpty {
            
            player1Turn()
            player2Turn()
            
        }
        
        if team1.isEmpty {
            print("\(player2Name) is the Winner !")
        } else {
            print("\(player1Name) is the Winner !")
        }
        
        print("In this game, \(numbersOfTurn) turns were played, \(numberOfChest) chests were found and \(numberOfCriticalStrike) critical strike were inflicted.")
    }
}



