//
//  QuizViewController.swift
//  Keymate
//
//  Created by Laureen Schausberger on 16.09.17.
//  Copyright © 2017 Laureen Schausberger. All rights reserved.
//

import Foundation
import UIKit

class QuizViewController: UIViewController {

    @IBOutlet weak var first: UIView!
    @IBOutlet weak var second: UIView!
    @IBOutlet weak var third: UIView!
    @IBOutlet weak var fourth: UIView!
    @IBOutlet weak var fifth: UIView!
    @IBOutlet weak var sixth: UIView!
    @IBOutlet weak var seventh: UIView!
    @IBOutlet weak var eighth: UIView!
    @IBOutlet weak var nineth: UIView!
    @IBOutlet weak var tenth: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hide(_1: false, _2: true, _3: true, _4: true, _5: true, _6: true, _7: true, _8: true, _9: true, _10: true)
        self.setup()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Custom Methods
    private func hide(_1 first: Bool, _2 second: Bool, _3 third: Bool, _4 fourth: Bool, _5 fifth: Bool, _6 sixth: Bool, _7 seventh: Bool, _8 eighth: Bool, _9 nineth: Bool, _10 tenth: Bool) {
        self.first.isHidden     = first
        self.second.isHidden    = second
        self.third.isHidden     = third
        self.fourth.isHidden    = fourth
        self.fifth.isHidden     = fifth
        self.sixth.isHidden     = sixth
        self.seventh.isHidden   = seventh
        self.eighth.isHidden    = eighth
        self.nineth.isHidden    = nineth
        self.tenth.isHidden     = tenth
    }
    
    @IBAction func switchedTabTo(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
        case 0:
            self.hide(_1: false, _2: true, _3: true, _4: true, _5: true, _6: true, _7: true, _8: true, _9: true, _10: true)
            break
        case 1:
            self.hide(_1: true, _2: false, _3: true, _4: true, _5: true, _6: true, _7: true, _8: true, _9: true, _10: true)
            break
        case 2:
            self.hide(_1: true, _2: true, _3: false, _4: true, _5: true, _6: true, _7: true, _8: true, _9: true, _10: true)
            break
        case 3:
            self.hide(_1: true, _2: true, _3: true, _4: false, _5: true, _6: true, _7: true, _8: true, _9: true, _10: true)
            break
        case 4:
            self.hide(_1: true, _2: true, _3: true, _4: true, _5: false, _6: true, _7: true, _8: true, _9: true, _10: true)
            break
        case 5:
            self.hide(_1: true, _2: true, _3: true, _4: true, _5: true, _6: false, _7: true, _8: true, _9: true, _10: true)
            break
        case 6:
            self.hide(_1: true, _2: true, _3: true, _4: true, _5: true, _6: true, _7: false, _8: true, _9: true, _10: true)
            break
        case 7:
            self.hide(_1: true, _2: true, _3: true, _4: true, _5: true, _6: true, _7: true, _8: false, _9: true, _10: true)
            break
        case 8:
            self.hide(_1: true, _2: true, _3: true, _4: true, _5: true, _6: true, _7: true, _8: true, _9: false, _10: true)
            break
        case 9:
            self.hide(_1: true, _2: true, _3: true, _4: true, _5: true, _6: true, _7: true, _8: true, _9: true, _10: false)
            break
        default:
            self.hide(_1: false, _2: true, _3: true, _4: true, _5: true, _6: true, _7: true, _8: true, _9: true, _10: true)
            break
            
        }
        
    }
    
    
    // MARK: Setup Elements
    private func setup() {
        self.navigationItem.title = "QUIZ"
        if let navController: UINavigationController = self.navigationController {
            navController.navigationBar.titleTextAttributes = [ NSFontAttributeName: UIFont.keymateHelveticaCondensedBold(fontSize: 20) ]
            navController.navigationBar.barStyle         = UIBarStyle.blackTranslucent
            navController.navigationBar.barTintColor     = UIColor.keymateOrange
            navController.navigationBar.isTranslucent    = false
            navController.navigationBar.tintColor        = UIColor.white
        }
    }
}

