//
//  BaseTaskController.swift
//  Keymate
//
//  Created by Laureen Schausberger on 17.09.17.
//  Copyright © 2017 Laureen Schausberger. All rights reserved.
//

import Foundation
import UIKit

class BaseTaskController: UIViewController {
    
    var currentTask: Int  = -1
    let userDefault           = UserDefaults.standard
    
    func checkIfAlreadyAnswered()/* -> Bool */{
        if self.userDefault.value(forKey: "task-points-for-\(self.currentTask)") == nil {
            //return false
        } else {
            //return true
        }
    }
    
    func saveAnswer(withIdentifier identifier: Int) {
        // 0 -> wrong
        // 1 -> right
        self.userDefault.set(identifier, forKey: "task-points-for-\(self.currentTask)")
    }
}
