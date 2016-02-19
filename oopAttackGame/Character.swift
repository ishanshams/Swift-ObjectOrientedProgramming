//
//  Character.swift
//  oopAttackGame
//
//  Created by Ishan Shams on 2/18/16.
//  Copyright © 2016 Ishan Shams. All rights reserved.
//

import Foundation

class Character {
    
    private var _hp: Int = 100
    private var _attackPower: Int = 10
    
    var hp : Int {
    get {
        return _hp
        }
    }
    
    var attackPower: Int {
        get {
            return _attackPower
        }
    }
    
    var isAlive: Bool {
        if _hp <= 0 {
            return false
        }
        return true
    }
    init(startingHp: Int, startingAttackPower: Int) {
        self._attackPower = startingAttackPower
        self._hp = startingHp
    }
    
    func attemptAttack(attackPower: Int) -> Bool {
        self._hp -= attackPower
        
        return true
    }
    
    
    
}