//
//  SetupViewController.swift
//  Talk Time
//
//  Created by Joey Comtois on 3/19/19.
//  Copyright © 2019 Keypress. All rights reserved.
//

import UIKit
import LocalAuthentication

class SetupViewController: UIViewController {

    let homeVC = ViewController()
    @IBOutlet var background: UIView!
    
    @IBOutlet weak var themeTitle: UILabel!

    @IBOutlet weak var classicTitle: UILabel!
    @IBOutlet weak var classicDesc: UILabel!
    
    @IBOutlet weak var darkTitle: UILabel!
    @IBOutlet weak var darkDesc: UILabel!
    
    @IBOutlet weak var devTitle: UILabel!
    @IBOutlet weak var devDesc: UILabel!
    
    @IBOutlet weak var marker: UIView!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        
        
        
        if self.title == "Select Theme" {
            
            background.backgroundColor = global.backgroundColor
            themeTitle.textColor = global.accentColor
            classicTitle.textColor = global.accentColor
            classicDesc.textColor = global.accentColor
            darkTitle.textColor = global.accentColor
            darkDesc.textColor = global.accentColor
            devTitle.textColor = global.accentColor
            devDesc.textColor = global.accentColor
        }
        

        
        
    }
    
    @IBAction func enableFaceID(_ sender: Any) {
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "Identify yourself!"
            
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) {
                [unowned self] (success, authenticationError) in
                
                DispatchQueue.main.async {
                    if success {
                        self.dismiss(animated: true, completion: nil)
                    } else {
                        // error
                    }
                }
            }
        } else {
            // no biometry
        }
    }
    
    @IBAction func setupLater(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    

    @IBAction func classicThemePressed(_ sender: Any) {
        print("gone classic")
        
        homeVC.lightTheme()
        
        
        UIView.animate(withDuration: 0.4) {
            self.background.backgroundColor = global.backgroundColor
            
            self.themeTitle.textColor = global.accentColor
            self.classicTitle.textColor = global.accentColor
            self.classicDesc.textColor = global.accentColor
            self.darkTitle.textColor = global.accentColor
            self.darkDesc.textColor = global.accentColor
            self.devTitle.textColor = global.accentColor
            self.devDesc.textColor = global.accentColor
        
        
        }

    }
    
    @IBAction func darkThemePressed(_ sender: Any) {
        print("gone dark")
        
        homeVC.darkTheme()
    
        UIView.animate(withDuration: 0.4) {
            self.background.backgroundColor = global.backgroundColor
            
            self.themeTitle.textColor = global.accentColor
            self.classicTitle.textColor = global.accentColor
            self.classicDesc.textColor = global.accentColor
            self.darkTitle.textColor = global.accentColor
            self.darkDesc.textColor = global.accentColor
            self.devTitle.textColor = global.accentColor
            self.devDesc.textColor = global.accentColor
        }
        
    }
    
    
    func reloadViewFromNib() {
        let parent = view.superview
        view.removeFromSuperview()
        view = nil
        parent?.addSubview(view) // This line causes the view to be reloaded
    }
    
}
