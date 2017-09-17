//
//  BaseTableViewController.swift
//  Keymate
//
//  Created by Laureen Schausberger on 27.01.17.
//  Copyright © 2017 Laureen Schausberger. All rights reserved.
//

import UIKit

class BaseTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setHeader()
        if let navController: UINavigationController = self.navigationController {
            navController.navigationBar.titleTextAttributes = [ NSFontAttributeName: UIFont.keymateHelveticaCondensedBold(fontSize: 20) ]
            navController.navigationBar.barStyle         = UIBarStyle.blackTranslucent
            navController.navigationBar.barTintColor     = UIColor.keymateOrange
            navController.navigationBar.isTranslucent    = false
        }
        
        if let tabController: UITabBarController = self.tabBarController {
            tabController.tabBar.selectedItem?.badgeColor = UIColor.keymateOrange
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setHeader(){
        self.navigationItem.title = "HIGHSCORE"
    }

}
