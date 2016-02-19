//
//  ViewController.swift
//  oopAttackGame
//
//  Created by Ishan Shams on 2/18/16.
//  Copyright © 2016 Ishan Shams. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var uiLabel: UILabel!
    @IBOutlet weak var enemy: UIImageView!
    @IBOutlet weak var player: UIImageView!
    @IBOutlet weak var enemyBtn: UIButton!
    @IBOutlet weak var playerBtn: UIButton!
    @IBOutlet weak var enemyHPLbl: UILabel!
    @IBOutlet weak var playerHPLbl: UILabel!
    
    @IBOutlet weak var enemyBtnLbl: UILabel!
    
    @IBOutlet weak var playerBtnLbl: UILabel!
    @IBOutlet weak var restartBtn: UIButton!
    
    var playerObject : Player!
    var enemyObject : Enemy!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        startGame()
        
        
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func restartGame(sender: AnyObject) {
        viewDidLoad()
        restartBtn.hidden = true
        restartHidden()
    }
    
    
    func startGame() {
        playerObject = Player(name: "Ishan", hp:
            120, attackPower: 25)
        enemyObject = Enemy(name: "Tyrion Lannister", hp: 90, attackPower: 20)
        playerHPLbl.text = "\(playerObject.hp) HP"
        enemyHPLbl.text = "\(enemyObject.hp) HP"
        uiLabel.text = "The Game of Thrones Begins!"
        
    }
    
    
    @IBAction func onEnemyAttackPress(sender: AnyObject) {
        
        if playerObject.attemptAttack(enemyObject.attackPower) {
            enemyFunctionHidden()
            NSTimer.scheduledTimerWithTimeInterval(3.0, target: self, selector: "enemyFunctionHidden", userInfo: nil, repeats: false)
            
            uiLabel.text = "\(enemyObject.name) attacked \(playerObject.name) for \(enemyObject.attackPower)"
            playerHPLbl.text = "\(playerObject.hp) HP"
            
        }
        else {
            uiLabel.text = "Attack was unsucessful"
        }
        
        if !playerObject.isAlive {
            playerHPLbl.hidden = true
            player.hidden = true
            restartBtn.hidden = false
            playerFunctionHidden()
            uiLabel.text = "\(enemyObject.name) won this round"
        }
    }
    
    @IBAction func onPlayerAttackPress(sender: AnyObject) {
        
        if enemyObject.attemptAttack(playerObject.attackPower) {
            
            playerFunctionHidden()
            NSTimer.scheduledTimerWithTimeInterval(3.0, target: self, selector: "playerFunctionHidden", userInfo: nil, repeats: false)
            
            uiLabel.text = "\(playerObject.name) attacked \(enemyObject.name) for \(playerObject.attackPower)"
            enemyHPLbl.text = "\(enemyObject.hp) HP"
            
        }
        else {
            uiLabel.text = "Attack was unsucessful"
        }
        
        if !enemyObject.isAlive {
            enemyHPLbl.hidden = true
            enemy.hidden = true
            restartBtn.hidden = false
            enemyFunctionHidden()
            uiLabel.text = "\(playerObject.name) won this round"
        }
    }
    
    func playerFunctionHidden() {
        if playerBtn.hidden == true {
        playerBtn.hidden = false
        playerBtnLbl.hidden = false
        }
        else {
            playerBtn.hidden = true
            playerBtnLbl.hidden = true
        }
    }
    
    func enemyFunctionHidden() {
        
        if enemyBtn.hidden == true {
            enemyBtn.hidden = false
            enemyBtnLbl.hidden = false
        }
        else {
            enemyBtn.hidden = true
            enemyBtnLbl.hidden = true
        }
    }
    
    func restartHidden() {
        enemy.hidden = false
        enemyBtnLbl.hidden = false
        enemyHPLbl.hidden = false
        enemyBtn.hidden = false
    
        player.hidden = false
        playerBtnLbl.hidden = false
        playerHPLbl.hidden = false
        playerBtn.hidden = false
        
    }
    
}

