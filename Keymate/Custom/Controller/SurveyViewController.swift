//
//  SurveyViewController.swift
//  Keymate
//
//  Created by Laureen Schausberger on 17.09.17.
//  Copyright © 2017 Laureen Schausberger. All rights reserved.
//

import Foundation
import UIKit

class SurveyViewController: UIViewController {
    
    @IBOutlet weak var first: UIView!
    @IBOutlet weak var second: UIView!
    @IBOutlet weak var third: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hide(_1: false, _2: true, _3: true)
        self.setup()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Custom Methods
    private func hide(_1 first: Bool, _2 second: Bool, _3 third: Bool) {
        self.first.isHidden     = first
        self.second.isHidden    = second
        self.third.isHidden     = third
    }
    
    @IBAction func switchedTabTo(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
        case 0:
            self.hide(_1: false, _2: true, _3: true)
            break
        case 1:
            self.hide(_1: true, _2: false, _3: true)
            break
        case 2:
            self.hide(_1: true, _2: true, _3: false)
            break
        case 3:
            self.hide(_1: true, _2: true, _3: true)
            break
        case 4:
            self.hide(_1: true, _2: true, _3: true)
            break
        default:
            self.hide(_1: false, _2: true, _3: true)
            break
            
        }
        
    }
    
    
    // MARK: Setup Elements
    private func setup() {
        self.navigationItem.title = "TASKS"
        if let navController: UINavigationController = self.navigationController {
            navController.navigationBar.titleTextAttributes = [ NSFontAttributeName: UIFont.keymateHelveticaCondensedBold(fontSize: 20) ]
            navController.navigationBar.barStyle         = UIBarStyle.blackTranslucent
            navController.navigationBar.barTintColor     = UIColor.keymateOrange
            navController.navigationBar.isTranslucent    = false
            navController.navigationBar.tintColor        = UIColor.white
        }
    }
}
