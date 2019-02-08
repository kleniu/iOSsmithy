//
//  DetailViewController1.swift
//  UISplitViewController
//
//  Created by Robert Kleniewski on 2/8/19.
//  Copyright © 2019 Robert Kleniewski. All rights reserved.
//

import UIKit

class DetailViewController1: LoggingViewController {

    var windowTitle = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("DetailViewController1.windowTitle=\(windowTitle)")
        navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
        navigationItem.leftItemsSupplementBackButton = true
    }
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }

}
