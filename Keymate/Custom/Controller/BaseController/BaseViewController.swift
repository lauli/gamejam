//
//  BaseViewController.swift
//  Keymate
//
//  Created by Laureen Schausberger on 04.03.17.
//  Copyright © 2017 Laureen Schausberger. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    @IBOutlet weak var containerProfile: UIView!
    @IBOutlet weak var containerAchievements: UIView!
    @IBOutlet weak var containerAttendance: UIView!
    @IBOutlet weak var segmentcontroller: UISegmentedControl!
    @IBOutlet weak var toolbar: UIToolbar!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hide(profile: false, achievement: true, attendance: true)
        self.setup()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Custom Methods
    private func hide(profile: Bool, achievement: Bool, attendance: Bool) {
        self.containerProfile.isHidden = profile
        self.containerAchievements.isHidden  = achievement
        self.containerAttendance.isHidden  = attendance
    }

    @IBAction func switchedTabTo(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
        case 0:
            // Profile
            self.hide(profile: false, achievement: true, attendance: true)
            break
        case 1:
            // Achievements
            self.hide(profile: true, achievement: false, attendance: true)
            break
        case 2:
            // Attendance
            self.hide(profile: true, achievement: true, attendance: false)
            break
        default:
            self.hide(profile: false, achievement: true, attendance: true)
            break
            
        }
        
    }
   
    
    // MARK: Setup Elements
    private func setup() {
        self.navigationItem.title = "PROFILE"
        if let navController: UINavigationController = self.navigationController {
            navController.navigationBar.titleTextAttributes = [ NSFontAttributeName: UIFont.keymateHelveticaCondensedBold(fontSize: 20) ]
            navController.navigationBar.barStyle         = UIBarStyle.blackTranslucent
            navController.navigationBar.barTintColor     = UIColor.keymateOrange
            navController.navigationBar.isTranslucent    = false
            navController.navigationBar.tintColor        = UIColor.white
        }
        self.segmentcontroller.backgroundColor =    UIColor.keymateOrange
        self.toolbar.barTintColor =                 UIColor.keymateOrange
    }
}
