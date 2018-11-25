//
//  ViewController.swift
//  Buttons Demo
//
//  Created by Robert Kleniewski on 11/25/18.
//  Copyright © 2018 Robert Kleniewski. All rights reserved.
//
//  Default ViewController class

import UIKit

class ViewController: UIViewController {

    // IBOutlet connects code with UI element
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var firstButton: UIButton!
    @IBOutlet weak var releaseButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // this id the place where you disable some UI objects
        releaseButton.isEnabled = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // this will be called BEFORE view appears
        // always call superclass overwritted method
        super.viewWillAppear(animated)
        print("viewWillAppear called.")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        // this will be called AFTER view appears
        // always call superclass overwritted method
        super.viewDidAppear(animated)
        print("viewDidAppear called.")
    }

    @IBAction func fistButton(_ sender: Any) {
        // this is an action for "This is my first Button"
        print("First button has been pressed.")
        // lets change the label message
        firstLabel.text = "Now, the first button is disabled. Press release button to enable the first button."
        firstButton.isEnabled = false
        releaseButton.isEnabled = true
    }
    
    @IBAction func releaseButton(_ sender: Any) {
        // this is an action for "Release Button"
        print("Release button has been pressed.")
        firstLabel.text = "You've pressed releaseButton. You are able to Click first button again."
        firstButton.isEnabled = true
        releaseButton.isEnabled = false
    }
}

