//
//  ViewController.swift
//  GBAlternateIcons
//
//  Created by MACBOOK on 20/07/17.
//  Copyright © 2017 JaimeLeon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func teamSelected(_ sender: UIButton)
    {
        if let iconName = sender.titleLabel?.text
        {
            alternateIconName(iconName)
        }
    }
    
    func alternateIconName(_ iconName: String)
    {
        // It should at least be iOS 10.3.0
        
        guard UIApplication.shared.supportsAlternateIcons else {
            let errorAlert = UIAlertController(title: "Error",
                                               message: "Sorry your device don't support Alternate icons",
                                               preferredStyle: .alert)
            errorAlert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.show(errorAlert, sender: nil)
            
            return
        }
        
        // Change the icon
        
        UIApplication.shared.setAlternateIconName(iconName) { (error) in
            if let error = error {
                print("error: \(error)")
            }
        }
    }
}

