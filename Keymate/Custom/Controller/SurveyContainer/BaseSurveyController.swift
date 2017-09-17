//
//  BaseSurveyController.swift
//  Keymate
//
//  Created by Laureen Schausberger on 17.09.17.
//  Copyright © 2017 Laureen Schausberger. All rights reserved.
//

import Foundation
import UIKit

class BaseSurveyController: UIViewController {
    
    var currentSurvey: Int  = -1
    let userDefault         = UserDefaults.standard
    
    func checkIfAlreadyAnswered() -> Bool {
        if self.userDefault.value(forKey: "survey-points-for-\(self.currentSurvey)") == nil {
            return false
        } else {
            return true
        }
    }
    
    func saveAnswer(withIdentifier identifier: Int) {
        // 0 -> wrong
        // 1 -> right
        self.userDefault.set(identifier, forKey: "survey-points-for-\(self.currentSurvey)")
        
        if identifier == 1, let highscore = self.userDefault.value(forKey: "highscore") as? Int {
            self.userDefault.set((highscore + 10), forKey: "highscore")
            print("updated highscore for survey = \((highscore+10))")
        }
    }
}
