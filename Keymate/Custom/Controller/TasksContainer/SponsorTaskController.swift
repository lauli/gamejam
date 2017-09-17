//
//  SponsorTaskController.swift
//  Keymate
//
//  Created by Laureen Schausberger on 17.09.17.
//  Copyright © 2017 Laureen Schausberger. All rights reserved.
//

import Foundation
import UIKit

class SponsorTaskController: BaseTaskController {
    
    override func viewWillAppear(_ animated: Bool) {
        self.currentTask = 1
    }
    
    @IBAction func clickedButton(_ sender: Any) {
        if self.checkIfAlreadyAnswered() {
            return
        }
        self.saveAnswer(withIdentifier: 1)
    }
    
}

class MusicTaskController: BaseTaskController {
    
    override func viewWillAppear(_ animated: Bool) {
        self.currentTask = 2
    }
    
    @IBAction func clickedButton(_ sender: Any) {
        if self.checkIfAlreadyAnswered() {
            return
        }
        self.saveAnswer(withIdentifier: 1)
    }
    
}

class GamblingTaskController: BaseTaskController {
    
    override func viewWillAppear(_ animated: Bool) {
        self.currentTask = 3
    }
    
    @IBAction func clickedButton(_ sender: Any) {
        if self.checkIfAlreadyAnswered() {
            return
        }
        self.saveAnswer(withIdentifier: 1)
    }
    
}

class SocialTaskController: BaseTaskController {
    
    override func viewWillAppear(_ animated: Bool) {
        self.currentTask = 4
    }
    
    @IBAction func clickedButton(_ sender: Any) {
        if self.checkIfAlreadyAnswered() {
            return
        }
        self.saveAnswer(withIdentifier: 1)
    }
    
}
