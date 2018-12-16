//
//  AboutViewController.swift
//  WebView and GET method
//
//  Created by Robert Kleniewski on 12/12/18.
//  Copyright © 2018 Robert Kleniewski. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {

    var viewParameters: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print("About View did load")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        print("About View did appear")
    }

    

}
