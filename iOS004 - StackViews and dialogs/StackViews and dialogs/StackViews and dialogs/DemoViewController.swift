//
//  DemoViewController.swift
//  StackViews and dialogs
//
//  Created by Robert Kleniewski on 11/30/18.
//  Copyright © 2018 Robert Kleniewski. All rights reserved.
//

import UIKit

class DemoViewController: UIViewController {
    var startedBy: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func button11Click(_ sender: Any) {
        // create action button for the controler
        let okAction = UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"),
                                     style: .default) { (action) in
                                        print("The \(action.title ?? "OK") button clicked.")
                                     }
            
        // create and configure actionController
        let alert = UIAlertController(title: "OK Alert",
                                      message: "This is an alert with OK button.",
                                      preferredStyle: .alert)
        
        alert.addAction(okAction)
        
        self.present(alert, animated: true) {
            print("The OK dialog was presented")
        }
    }
    
    @IBAction func button12click(_ sender: Any) {
        // Create the action buttons for the alert.
        let defaultAction = UIAlertAction(title: "Agree",
                                          style: .default) { (action) in
                                            // Respond to user selection of the action.
                                            print("The \(action.title ?? "Agree") button clicked.")
        }
        let cancelAction  = UIAlertAction(title: "Disagree",
                                          style: .cancel) { (action) in
                                            // Respond to user selection of the action.
                                            print("The \(action.title ?? "Disagree") button clicked.")
        }
        
        // Create and configure the alert controller.
        let alert = UIAlertController(title: "Terms and Conditions",
                                      message: "Click Agree to accept the terms and conditions.",
                                      preferredStyle: .alert)
        
        alert.addAction(defaultAction)
        alert.addAction(cancelAction)
        
        self.present(alert, animated: true) {
            print("The Agree/Disagree alert was presented")
        }
    }
    
    
    @IBAction func button13click(_ sender: Any) {
        // Create the action buttons for the alert.
        let defaultAction      = UIAlertAction(title: "No",
                                               style: .default) { (action) in
                                                // Respond to user selection of the action.
                                                print("The \(action.title ?? "No") button clicked.")
        }
        let cancelAction       = UIAlertAction(title: "Later",
                                               style: .cancel) { (action) in
                                                // Respond to user selection of the action.
                                                print("The \(action.title ?? "Later") button clicked.")
        }
        let destructiveAction  = UIAlertAction(title: "Remove",
                                                style: .destructive) { (action) in
                                                // Respond to user selection of the action.
                                                print("The \(action.title ?? "Remove") button clicked.")
        }
        
        // Create and configure the alert controller.
        let alert = UIAlertController(title: "Destruct test",
                                      message: "Choose of of the three options.",
                                      preferredStyle: .alert)
        
        alert.addAction(defaultAction)
        alert.addAction(cancelAction)
        alert.addAction(destructiveAction)
        
        self.present(alert, animated: true) {
            print("The No/Later/Remove alert was presented")
        }
    }
    
    @IBAction func button21click(_ sender: Any) {
        // create action button for the controler
        let okAction = UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"),
                                     style: .default) { (action) in
                                        print("The \(action.title ?? "OK") button clicked.")
        }
        
        // create and configure actionController
        let alert = UIAlertController(title: "OK Alert",
                                      message: "This is an alert with OK button.",
                                      preferredStyle: .actionSheet)
        
        alert.addAction(okAction)
        
        self.present(alert, animated: true) {
            print("The OK actionSheet was presented")
        }
    }
    
    @IBAction func button22click(_ sender: Any) {
        // Create the action buttons for the alert.
        let defaultAction = UIAlertAction(title: "Agree",
                                          style: .default) { (action) in
                                            // Respond to user selection of the action.
                                            print("The \(action.title ?? "Agree") button clicked.")
        }
        let cancelAction  = UIAlertAction(title: "Disagree",
                                          style: .cancel) { (action) in
                                            // Respond to user selection of the action.
                                            print("The \(action.title ?? "Disagree") button clicked.")
        }
        
        // Create and configure the alert controller.
        let alert = UIAlertController(title: "Terms and Conditions",
                                      message: "Click Agree to accept the terms and conditions.",
                                      preferredStyle: .actionSheet)
        
        alert.addAction(defaultAction)
        alert.addAction(cancelAction)
        
        self.present(alert, animated: true) {
            print("The Agree/Disagree actionSheet was presented")
        }
    }
    
    @IBAction func button23click(_ sender: Any) {
        // Create the action buttons for the alert.
        let defaultAction      = UIAlertAction(title: "No",
                                               style: .default) { (action) in
                                                // Respond to user selection of the action.
                                                print("The \(action.title ?? "No") button clicked.")
        }
        let cancelAction       = UIAlertAction(title: "Later",
                                               style: .cancel) { (action) in
                                                // Respond to user selection of the action.
                                                print("The \(action.title ?? "Later") button clicked.")
        }
        let destructiveAction  = UIAlertAction(title: "Remove",
                                               style: .destructive) { (action) in
                                                // Respond to user selection of the action.
                                                print("The \(action.title ?? "Remove") button clicked.")
        }
        
        // Create and configure the alert controller.
        let alert = UIAlertController(title: "Destruct test",
                                      message: "Choose of of the three options.",
                                      preferredStyle: .actionSheet)
        
        alert.addAction(defaultAction)
        alert.addAction(cancelAction)
        alert.addAction(destructiveAction)
        
        self.present(alert, animated: true) {
            print("The No/Later/Remove actionSheet was presented")
        }
    }
    
    
}
