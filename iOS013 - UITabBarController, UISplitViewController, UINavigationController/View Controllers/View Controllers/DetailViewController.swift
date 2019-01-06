//
//  DetailViewController.swift
//  View Controllers
//
//  Created by Robert Kleniewski on 1/1/19.
//  Copyright © 2019 Robert Kleniewski. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var myModelOptional: Emojis?
    var myTableViewOptional: UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let myModel = myModelOptional {
                print("Detail view for: \(myModel.getCurrentGroupName())")
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let myModel = myModelOptional {
            let curGroup = myModel.curGroupSelection
            let items = myModel.mydata[curGroup].items
            for i in 0..<6 {
                print("Item: \(items[i].itemIcon); state: \(items[i].itemState)")
                // no update labels on UILabel views with tags 10,20,30 ...
                if let myLabel = self.view.viewWithTag( (i+1)*10 ) as? UILabel {
                    myLabel.text = items[i].itemIcon
                }
                // do the same trick on UISwitch views with tags 11,21,31 ...
                if let mySwitch = self.view.viewWithTag( (i+1)*10 + 1 ) as? UISwitch {
                    mySwitch.isHidden = false
                    mySwitch.isOn = items[i].itemState
                }
            }
        }
        else {
            // the detailed view did not show on master view item click
            for i in 0..<6 {
                if let myLabel = self.view.viewWithTag( (i+1)*10 ) as? UILabel {
                    myLabel.text = ""
                }
                // do the same trick on UISwitch views with tags 11,21,31 ...
                if let mySwitch = self.view.viewWithTag( (i+1)*10 + 1 ) as? UISwitch {
                    mySwitch.isHidden = true
                }
            }
        }
    }

    @IBAction func switchValueChanged(_ sender: UISwitch) {
        let mySwitchTag = sender.tag;
        let myItemIndex = ( (mySwitchTag - 1)/10 ) - 1
        
        if let myModel = myModelOptional {
            let curGroup = myModel.curGroupSelection
            // we have to change the item state directly (by reference)
            myModel.mydata[curGroup].items[myItemIndex].itemState = sender.isOn
            
            if let myTableView = myTableViewOptional {
                myTableView.reloadData()
            }
            
            print("Switch with tag: \(mySwitchTag) changed. Items index: \(myItemIndex). State is: \(sender.isOn)")
        }
    }
    
    
}
