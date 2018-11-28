//
//  SecondViewController.swift
//  Multiple views with args
//
//  Created by Robert Kleniewski on 11/27/18.
//  Copyright © 2018 Robert Kleniewski. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    var paramSender: String = ""
    var paramToSend: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print("Second view did load. paramSender=\(paramSender); paramToSend=\(paramToSend)")
    }
    


}
