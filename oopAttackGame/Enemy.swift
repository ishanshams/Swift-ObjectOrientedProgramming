//
//  Enemy.swift
//  oopAttackGame
//
//  Created by Ishan Shams on 2/18/16.
//  Copyright © 2016 Ishan Shams. All rights reserved.
//

import Foundation

class Enemy: Character {
    private var _name: String = "Enemy"
    
    var name : String {
        get {
            return _name
        }
    }
    
    convenience init(name: String, hp: Int, attackPower: Int) {
        self.init(startingHp: hp, startingAttackPower: attackPower)
        self._name = name
    }
}