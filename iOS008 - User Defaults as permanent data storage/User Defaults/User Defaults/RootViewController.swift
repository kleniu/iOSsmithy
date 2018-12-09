//
//  RootViewController.swift
//  User Defaults
//
//  Created by Robert Kleniewski on 12/9/18.
//  Copyright © 2018 Robert Kleniewski. All rights reserved.
//

import UIKit

class RootViewController: UIViewController, UITextFieldDelegate {

    var userData = UserData(textVal: "This is test text")
    
    // needed to access data and set the delegate to this view
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var switchBar: UISwitch!
    @IBOutlet weak var slideBar: UISlider!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var loadButton: UIButton!
    @IBOutlet weak var removeButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // setting the delegate is not enough to show the keyboard
        // in the simulator use menu
        // it is required for textFieldShouldReturn
        textField.delegate = self
        
    }

    // MARK: displaying About View
    
    @IBAction func aboutButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "AboutViewSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AboutViewSegue" {
            let aboutVC = segue.destination as! AboutViewController
            aboutVC.params = "some params passed to the About View."
        }
    }
    
    // MARK: textField methods
    
    @IBAction func textFieldEditingDidBegin(_ sender: Any) {
        print("Editing Did Begin")
    }
    
    @IBAction func textFieldEditingDidEnd(_ sender: Any) {
        print("Editing Did End")
    }
    
    
    // it just ends editing when user hits the return key
    // is not enough to show the keyboard when using simulator - enable it in the menu
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    // it just ends editing when user toutches area outside of Edit box
    // is not enough to show the keyboard when using simulator - enable it in the menu
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    // MARK: button methods
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        // store current values in the object
        userData.boolVal  = switchBar.isOn
        userData.floatVal = slideBar.value
        userData.textVal  = textField.text ?? ""
        // let's save data
        userData.saveData()
    }
    
    @IBAction func loadButtonPressed(_ sender: Any) {
        if userData.loadData() {
            switchBar.setOn(userData.boolVal, animated: true)
            slideBar.setValue(userData.floatVal, animated: true)
            textField.text = userData.textVal
        }
        else {
            print("I cannot load data form User Defaults.")
        }
    }
    
    @IBAction func removeButtonPressed(_ sender: Any) {
        userData.removeData()
        switchBar.setOn(userData.boolVal, animated: true)
        slideBar.setValue(userData.floatVal, animated: true)
        textField.text = userData.textVal
    }
    
    
}

