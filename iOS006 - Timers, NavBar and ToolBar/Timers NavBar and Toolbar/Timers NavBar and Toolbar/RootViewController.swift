//
//  RootViewController.swift
//  Timers NavBar and Toolbar
//
//  Created by Robert Kleniewski on 12/8/18.
//  Copyright © 2018 Robert Kleniewski. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {

    // navigation between Views
    @IBAction func helpButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "helpViewSegue", sender: "helpButton has been pressed")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "helpViewSegue" {
            let helpVC = segue.destination as! HelpViewController
            let params = sender as! String
            helpVC.helpViewParams = params
        }
    }
    // end of navigation between Views
    
    // ######## processing Timer
    var timer = Timer()
    var secondsLeft: Int = 210
    
    @objc func decreaseTimerCallback() { // it will be called thanks to Selector
        if secondsLeft > 0 {
            secondsLeft -= 1
        }
        else {
            timer.invalidate()
        }
        secondsLeftText.text = "\(secondsLeft) sec"
    }
    
    @IBOutlet weak var secondsLeftText: UILabel!
    
    // this starts the timer
    @IBAction func playButtonPressed(_ sender: Any) {
        timer = Timer.scheduledTimer(timeInterval: 1, // in seconds
                                     target: self,    // target where to send a message
                                     selector: #selector((RootViewController.decreaseTimerCallback)), // here we specyfy what method will be called every tick
                                     userInfo: nil,
                                     repeats: true )
    }
    
    @IBAction func pauseButtonPressed(_ sender: Any) {
        print("stop ticking")
        timer.invalidate()
        secondsLeftText.text = "\(secondsLeft) sec"
    }
    
    @IBAction func plusTenPressed(_ sender: Any) {
        secondsLeft += 10
        secondsLeftText.text = "\(secondsLeft) sec"
    }
    
    @IBAction func minusTenPressed(_ sender: Any) {
        if secondsLeft > 10 {
            secondsLeft -= 10
        }
        secondsLeftText.text = "\(secondsLeft) sec"
    }
    
    @IBAction func resetPressed(_ sender: Any) {
        timer.invalidate()
        secondsLeft = 210
        secondsLeftText.text = "\(secondsLeft) sec"
    }
    // ######## end processing Timer
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

