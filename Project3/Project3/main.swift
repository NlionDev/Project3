//
//  main.swift
//  Project3
//
//  Created by Nicolas Lion on 14/10/2018.
//  Copyright © 2018 Nicolas Lion. All rights reserved.
//

var gameManager = GameManager()

gameManager.welcome()

gameManager.createTeam1()
gameManager.createTeam2()

gameManager.description(team: &team1)
gameManager.description(team: &team2)








