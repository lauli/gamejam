//
//  EventTableViewController.swift
//  Keymate
//
//  Created by Laureen Schausberger on 17.09.17.
//  Copyright © 2017 Laureen Schausberger. All rights reserved.
//

import Foundation
import UIKit

class EventTableViewController: BaseTableViewController {
    
    @IBOutlet weak var imageQuiz: UIImageView!
    @IBOutlet weak var imageTask: UIImageView!
    @IBOutlet weak var imageGame: UIImageView!
    @IBOutlet weak var imageSurvey: UIImageView!
    @IBOutlet weak var resultQuiz: UILabel!
    @IBOutlet weak var resultTasks: UILabel!
    
    
    let userDefault = UserDefaults.standard
    
    override func viewWillAppear(_ animated: Bool) {
        if !self.quizIsFinished() {
            self.imageQuiz.image = UIImage(named: "placeholder")
        }
        if !self.taskIsFinished() {
            self.imageTask.image = UIImage(named: "paper-plane")
        }
        if !self.gameIsFinished() {
            self.imageGame.image = UIImage(named: "world")
        }
        if !self.surveyIsFinished() {
            self.imageSurvey.image = UIImage(named: "list")
        }
    }
    
}

extension EventTableViewController {
    func quizIsFinished() -> Bool {
        var correctAnswers = 0
        for index in 1..<11 {
            if self.userDefault.value(forKey: "quiz-points-for-\(index)") == nil {
                return false
            }
            else if self.userDefault.value(forKey: "quiz-points-for-\(index)") as! Int == 1 {
                correctAnswers += 1
            }
        }
        self.imageQuiz.image = UIImage(named: "like")
        self.resultQuiz.text = "\(correctAnswers)/10 correct"
        return true
    }
    
    func taskIsFinished() -> Bool {
        return false
    }
    
    func gameIsFinished() -> Bool {
        return false
    }
    
    func surveyIsFinished() -> Bool {
        return false
    }
}
