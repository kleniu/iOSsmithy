//
//  SelectionViewController.swift
//  Simple TableView and Sliders
//
//  Created by Robert Kleniewski on 12/8/18.
//  Copyright © 2018 Robert Kleniewski. All rights reserved.
//

import UIKit

class SelectionViewController: UIViewController {

    @IBOutlet weak var clickedItemText: UILabel!
    @IBOutlet weak var sliderValueText: UILabel!

    var clickedItem: Int = 0
    var sliderValue: Float = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // it will run before view slide over
    override func viewWillAppear(_ animated: Bool) {
        clickedItemText.text = "Clicked item: \(clickedItem + 1)"
        sliderValueText.text = "Slider value: \(sliderValue)"
    }

}
