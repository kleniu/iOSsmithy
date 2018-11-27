//
//  RootViewController.swift
//  Multiple views with args
//
//  Created by Robert Kleniewski on 11/27/18.
//  Copyright © 2018 Robert Kleniewski. All rights reserved.
//

import UIKit

class RootViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var firstButton: UIButton!
    @IBOutlet weak var secondButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Root View did load")
        
        textField.delegate = self
    }


    @IBAction func firstButtonClick(_ sender: Any) {
        print("First button click. Text message: \(textField.text!)")
    }
    
    
    @IBAction func secondButtonClick(_ sender: Any) {
        print("Second button click. Text message: \(textField.text!)")
    }
    
    @IBAction func textFieldChanged(_ sender: Any) {
        print("Editing did end with text: \(textField.text!)")
    }
    
    // Called when 'return' key pressed. return NO to ignore.
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    // Called when the user click outside the UITextField.
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

