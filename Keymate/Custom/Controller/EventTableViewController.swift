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
    
    override func setHeader() {
        self.navigationItem.title = "080496"
    }
    
}

extension EventTableViewController {
    func quizIsFinished() -> Bool {
        var correctAnswers = 0
        var wrongAnswers = 0
        var allFinished   = true
        for index in 1..<11 {
            if self.userDefault.value(forKey: "quiz-points-for-\(index)") == nil {
                allFinished = false
            }
            else if self.userDefault.value(forKey: "quiz-points-for-\(index)") as! Int == 1 {
                correctAnswers += 1
            }
            else {
                wrongAnswers += 1
            }
        }
        
        if allFinished {
            self.imageQuiz.image = UIImage(named: "like")
            self.resultQuiz.text = "\(correctAnswers)/10 correct"
        }
        else {
            self.resultQuiz.text = "\(correctAnswers+wrongAnswers)/10 finished"
        }
        return allFinished
    }
    
    func taskIsFinished() -> Bool {
        var finishedTasks = 0
        var allFinished   = true
        for index in 1..<5 {
            if self.userDefault.value(forKey: "task-points-for-\(index)") == nil {
                self.resultTasks.text = "\(finishedTasks)/4 finished"
                allFinished = false
            }
            else if self.userDefault.value(forKey: "task-points-for-\(index)") as! Int == 1 {
                finishedTasks += 1
            }
        }
        self.imageTask.image = UIImage(named: "like")
        self.resultTasks.text = "\(finishedTasks)/4 finished"
        return allFinished
    }
    
    func gameIsFinished() -> Bool {
        return false
    }
    
    func surveyIsFinished() -> Bool {
        for index in 1..<4 {
            if self.userDefault.value(forKey: "survey-points-for-\(index)") == nil {
                return false
            }
        }
        self.imageSurvey.image = UIImage(named: "like")
        return true
    }
}
