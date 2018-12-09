//
//  AddItemViewController.swift
//  User Defaults part2
//
//  Created by Robert Kleniewski on 12/9/18.
//  Copyright © 2018 Robert Kleniewski. All rights reserved.
//

import UIKit

class AddItemViewController: UIViewController, UITextFieldDelegate {
    
    var userData: UserData = UserData()
    
    var viewParam: String = ""
    @IBOutlet weak var addTextField: UITextField!
    @IBOutlet weak var statusLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // dont't have to do this since I've drag the TextEdit to ViewControler on storyboard
        // addTextField.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        statusLabel.text = ""
    }
    
    @IBAction func addButtonPressed(_ sender: Any) {
        userData.loadDataToBuf()
        userData.addDataItemToBuf(text: addTextField.text!) // we can use force unwrap because UITextField _never_ is nil
        userData.saveDataFromBuf()
        statusLabel.text = "Success"
    }
 
    // exit editing on return key
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        addTextField.resignFirstResponder()
        return true
    }
    
    // exit editing on pressing outside text field area
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
}
