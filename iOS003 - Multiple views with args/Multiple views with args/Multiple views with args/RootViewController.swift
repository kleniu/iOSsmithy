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
        // this will initialize the segue - then prepare method is called
        performSegue(withIdentifier: "firstViewSegue", sender: "firstButton")
    }
    
    
    @IBAction func secondButtonClick(_ sender: Any) {
        print("Second button click. Text message: \(textField.text!)")
        performSegue(withIdentifier: "secondViewSegue", sender: "secondButton")
    }
    
    @IBAction func textFieldChanged(_ sender: Any) {
        print("Editing did end with text: \(textField.text!)")
    }
    
    // segue code
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // now let's check the segue identifier
        print("segue prepare in root view controller started")
        if segue.identifier == "firstViewSegue" {
            // view controller is encapsulated with segue using "forced upcast" (as!)
            let firstVC = segue.destination as! FirstViewController
            // now lets grab the string indicating who has initiated segue
            let dataSender = sender as! String
            // now let's grab the text field string
            let dataToSend = textField.text!
            // now we can store data to be passed
            firstVC.dataSender = dataSender
            firstVC.dataToSend = dataToSend
        }
        // do the same for second view segue
        if segue.identifier == "secondViewSegue" {
            let secondVC = segue.destination as! SecondViewController
            let dataSender = sender as! String
            let dataToSend = textField.text!
            secondVC.paramSender = dataSender
            secondVC.paramToSend = dataToSend
        }
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

