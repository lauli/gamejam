//
//  AllSurveyControllers.swift
//  Keymate
//
//  Created by Laureen Schausberger on 17.09.17.
//  Copyright © 2017 Laureen Schausberger. All rights reserved.
//

import Foundation
import UIKit

class FirstSurveyController: BaseSurveyController {
    
    override func viewWillAppear(_ animated: Bool) {
        self.currentSurvey = 1
    }
    
    @IBAction func clickedButton(_ sender: Any) {
        if self.checkIfAlreadyAnswered() {
            return
        }
        
        self.saveAnswer(withIdentifier: 1)
    }
    
}

class SecondSurveyController: BaseSurveyController {
    @IBOutlet weak var buttonA: UIButton!
    @IBOutlet weak var buttonB: UIButton!
    @IBOutlet weak var buttonC: UIButton!
    @IBOutlet weak var buttonD: UIButton!
    
    override func viewWillAppear(_ animated: Bool) {
        self.currentSurvey = 2
        self.setup()
        
    }
    
    @IBAction func clickedButton(_ sender: Any) {
        if self.checkIfAlreadyAnswered() {
            return
        }
        
        self.saveAnswer(withIdentifier: 1)
    }
    
    func setup() {
        //BUTTON DESIGN
        self.buttonA.layer.cornerRadius = CGFloat(10)
        self.buttonB.layer.cornerRadius = CGFloat(10)
        self.buttonC.layer.cornerRadius = CGFloat(10)
        self.buttonD.layer.cornerRadius = CGFloat(10)
        
        self.buttonA.layer.borderColor = UIColor.white.cgColor
        self.buttonB.layer.borderColor = UIColor.white.cgColor
        self.buttonC.layer.borderColor = UIColor.white.cgColor
        self.buttonD.layer.borderColor = UIColor.white.cgColor
        
        self.buttonA.layer.borderWidth = CGFloat(0.5)
        self.buttonB.layer.borderWidth = CGFloat(0.5)
        self.buttonC.layer.borderWidth = CGFloat(0.5)
        self.buttonD.layer.borderWidth = CGFloat(0.5)
    }
    
}

class ThirdSurveykController: BaseSurveyController {
    @IBOutlet weak var buttonA: UIButton!
    @IBOutlet weak var buttonB: UIButton!
    @IBOutlet weak var buttonC: UIButton!
    @IBOutlet weak var buttonD: UIButton!
    @IBOutlet weak var buttonE: UIButton!
    
    override func viewWillAppear(_ animated: Bool) {
        self.currentSurvey = 3
        self.setup()
    }
    
    @IBAction func clickedButton(_ sender: Any) {
        if self.checkIfAlreadyAnswered() {
            return
        }
        
        self.saveAnswer(withIdentifier: 1)
    }
    
    func setup() {
        //BUTTON DESIGN
        self.buttonA.layer.cornerRadius = CGFloat(10)
        self.buttonB.layer.cornerRadius = CGFloat(10)
        self.buttonC.layer.cornerRadius = CGFloat(10)
        self.buttonD.layer.cornerRadius = CGFloat(10)
        self.buttonE.layer.cornerRadius = CGFloat(10)
        
        self.buttonA.layer.borderColor = UIColor.white.cgColor
        self.buttonB.layer.borderColor = UIColor.white.cgColor
        self.buttonC.layer.borderColor = UIColor.white.cgColor
        self.buttonD.layer.borderColor = UIColor.white.cgColor
        self.buttonE.layer.borderColor = UIColor.white.cgColor

        self.buttonA.layer.borderWidth = CGFloat(0.5)
        self.buttonB.layer.borderWidth = CGFloat(0.5)
        self.buttonC.layer.borderWidth = CGFloat(0.5)
        self.buttonD.layer.borderWidth = CGFloat(0.5)
        self.buttonE.layer.borderWidth = CGFloat(0.5)

    }
    
}
