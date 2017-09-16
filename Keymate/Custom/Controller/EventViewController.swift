//
//  SettingsViewController.swift
//  Keymate
//
//  Created by Laureen Schausberger on 05.03.17.
//  Copyright © 2017 Laureen Schausberger. All rights reserved.
//

import Foundation
import UIKit

class EventViewController: BaseViewController {
    
    @IBOutlet weak var webview: UIWebView!
    
    override func viewDidLoad() {
        
        print("loaded")
        
        if let url = URL(string: "http://folk.ntnu.no/sondrels/imt1292/pages/arcade.html") {
            self.webview.loadRequest(URLRequest(url: url))
        }
    }
    
}
