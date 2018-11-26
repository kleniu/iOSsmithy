//
//  RootViewController.swift
//  Multiple views demo
//
//  Created by Robert Kleniewski on 11/26/18.
//  Copyright © 2018 Robert Kleniewski. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {

    @IBOutlet weak var firstButton: UIButton!
    @IBOutlet weak var secondButton: UIButton!
    @IBOutlet weak var thirdButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


    @IBAction func firstButtonClick(_ sender: Any) {
        print("First button clicked")
    }
    
    @IBAction func secondButtonClick(_ sender: Any) {
        print("Second button clicked")
    }
   
    @IBAction func thirdButtonClick(_ sender: Any) {
        print("Third button clicked")
    }
    
}

