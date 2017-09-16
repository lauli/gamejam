//
//  LoginViewController.swift
//  Keymate
//
//  Created by Laureen Schausberger on 27.01.17.
//  Copyright © 2017 Laureen Schausberger. All rights reserved.
//

import UIKit
import LocalAuthentication

class LoginViewController: UIViewController {

    @IBOutlet weak var passwordfield: UITextField!
    
    var context = LAContext()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.layer.backgroundColor = UIColor.keymateOrange.cgColor
        //self.passwordfield.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        self.passwordfield.resignFirstResponder()
        
        //login
        if !isPasswordSet() {
            setPassword(password: passwordfield.text!)
        }
        else {
            if !isPasswordCorrect() || passwordfield.text?.characters.count == 0 {
                passwordfield.textColor         = UIColor.keymateOrange
                passwordfield.text              = "event key unknown"
                passwordfield.isSecureTextEntry = false
                showAlertWith(title: "Error", message: "Event key is unknown.")
            } else {
                return true
            }
            
        }
        return false
    }
  

    @IBAction func pressedEnter(_ sender: Any) {
        performSegue(withIdentifier: "segueToEvents", sender: sender)
    }
    
    // MARK: Masterkey-Security Check
    private func isPasswordSet() -> Bool {
        if UserDefaults.standard.value(forKey: "password") == nil {
            return false
        } else {
            return true
        }
    }
    
    private func setPassword(password: String){
        let defaults = UserDefaults.standard
        defaults.set(password, forKey: "password")
    }
        
        
    private func isPasswordCorrect() -> Bool {
        if passwordfield.text == (UserDefaults.standard.value(forKey: "password") as? String) {
            return true
        } else {
            return false
        }
    }
    
    private func isFingerprintAllowed() -> Bool {
        if UserDefaults.standard.value(forKey: "fingerprint") == nil {
            return true
        } else {
            let holder = UserDefaults.standard.value(forKey: "fingerprint") as? String
            if holder == "true" {
                return true
            } else {
                return false
            }
        }
    }
    
    // MARK: Alert
    private func showAlertWith(title: String, message: String ) {
        
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Dismiss", style: .default, handler: nil)
        alertVC.addAction(okAction)
        
        DispatchQueue.main.async {
            self.present(alertVC, animated: true, completion: nil)
        }
        
    }
    
    // MARK: Forwarding
    private func forwarding() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let navigationController = storyboard.instantiateViewController(withIdentifier: "eventTableView") as! UINavigationController
        self.present(navigationController, animated: true)
    }
    
}
