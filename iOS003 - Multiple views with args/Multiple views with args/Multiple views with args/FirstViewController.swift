//
//  FirstViewController.swift
//  Multiple views with args
//
//  Created by Robert Kleniewski on 11/27/18.
//  Copyright © 2018 Robert Kleniewski. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    var dataSender: String = ""
    var dataToSend: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        print("First view did load. dataSender=\(dataSender); dataToSend=\(dataToSend)")
    }
    

}
