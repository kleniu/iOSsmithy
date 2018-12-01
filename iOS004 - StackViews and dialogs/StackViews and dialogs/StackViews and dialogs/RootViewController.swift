//
//  RootViewController.swift
//  StackViews and dialogs
//
//  Created by Robert Kleniewski on 11/30/18.
//  Copyright © 2018 Robert Kleniewski. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {

    @IBOutlet weak var clickMeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func clickMeButtonClicked(_ sender: Any) {
        print("ClickMe button clicked.")
        performSegue(withIdentifier: "demoView", sender: "clickMeButton")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "demoView" {
            print("Starting Demo View")
            let demoVC = segue.destination as! DemoViewController
            demoVC.startedBy = segue.identifier!
        }
    }
}

