//
//  HelpViewController.swift
//  Timers NavBar and Toolbar
//
//  Created by Robert Kleniewski on 12/8/18.
//  Copyright © 2018 Robert Kleniewski. All rights reserved.
//

import UIKit

class HelpViewController: UIViewController {

    var helpViewParams: String = ""
    
    @IBOutlet weak var helpTitleText: UILabel!
    @IBOutlet weak var helpSubtitleText: UILabel!
    @IBOutlet weak var helpText: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        helpTitleText.text    = "How to use?"
        helpSubtitleText.text = "Simple timer with extra features"
        helpText.text         = """
                                1) press Play button to start
                                2) press Pause button to hold countdown
                                3) press Restet button to startover
                                """
    }
}
