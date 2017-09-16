//
//  BaseQuizController.swift
//  Keymate
//
//  Created by Laureen Schausberger on 17.09.17.
//  Copyright © 2017 Laureen Schausberger. All rights reserved.
//

import Foundation
import UIKit

class BaseQuizController: UIViewController{
    
    @IBOutlet weak var buttonA: UIButton!
    @IBOutlet weak var buttonB: UIButton!
    @IBOutlet weak var buttonC: UIButton!
    @IBOutlet weak var buttonD: UIButton!
    
    var correctAnswer: String = ""
    
    
    override func viewDidLoad() {
        self.setup()
    }
    
    @IBAction func clickedButtonA(_ sender: Any) {
        if self.correctAnswer == "A" {
            self.buttonA.layer.backgroundColor = UIColor.green.cgColor
        }
        else {
            self.wrongAnswer()
        }
    }
    
    @IBAction func clickedButtonB(_ sender: Any) {
        if self.correctAnswer == "B" {
            self.buttonB.layer.backgroundColor = UIColor.green.cgColor
        }
        else {
            self.wrongAnswer()
        }
    }
    
    @IBAction func clickedButtonC(_ sender: Any) {
        if self.correctAnswer == "C" {
            self.buttonC.layer.backgroundColor = UIColor.green.cgColor
        }
        else {
            self.wrongAnswer()
        }
    }
    
    @IBAction func clickedButtonD(_ sender: Any) {
        if self.correctAnswer == "D" {
            self.buttonD.layer.backgroundColor = UIColor.green.cgColor
        }
        else {
            self.wrongAnswer()
        }
    }
    
}

extension BaseQuizController {
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
    
    func wrongAnswer() {
        switch self.correctAnswer {
        case "A":
            self.buttonA.layer.backgroundColor = UIColor.green.cgColor
            self.buttonB.layer.backgroundColor = UIColor.red.cgColor
            self.buttonC.layer.backgroundColor = UIColor.red.cgColor
            self.buttonD.layer.backgroundColor = UIColor.red.cgColor
            break
        case "B":
            self.buttonA.layer.backgroundColor = UIColor.red.cgColor
            self.buttonB.layer.backgroundColor = UIColor.green.cgColor
            self.buttonC.layer.backgroundColor = UIColor.red.cgColor
            self.buttonD.layer.backgroundColor = UIColor.red.cgColor
            break
        case "C":
            self.buttonA.layer.backgroundColor = UIColor.red.cgColor
            self.buttonB.layer.backgroundColor = UIColor.red.cgColor
            self.buttonC.layer.backgroundColor = UIColor.green.cgColor
            self.buttonD.layer.backgroundColor = UIColor.red.cgColor
            break
        case "D":
            self.buttonA.layer.backgroundColor = UIColor.red.cgColor
            self.buttonB.layer.backgroundColor = UIColor.red.cgColor
            self.buttonC.layer.backgroundColor = UIColor.red.cgColor
            self.buttonD.layer.backgroundColor = UIColor.green.cgColor
            break
        default:
            self.buttonA.layer.backgroundColor = .none
            self.buttonB.layer.backgroundColor = .none
            self.buttonC.layer.backgroundColor = .none
            self.buttonD.layer.backgroundColor = .none
        
        }
    }
    
    
    
}
