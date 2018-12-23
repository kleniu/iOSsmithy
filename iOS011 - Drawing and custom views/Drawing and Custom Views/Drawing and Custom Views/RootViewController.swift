//
//  ViewController.swift
//  Drawing and Custom Views
//
//  Created by Robert Kleniewski on 12/18/18.
//  Copyright © 2018 Robert Kleniewski. All rights reserved.
//

import UIKit

class RootViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let menuItems: [(String,String)] = [ ("Simple Draw Demo","SimpleDrawVCsegue"),
                                         ("Error Handling test", "ErrorVCsegue")]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let currentCell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "reusableCell")
        currentCell.textLabel?.text = menuItems[indexPath.row].0
        return currentCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: menuItems[indexPath.row].1, sender: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func aboutButtonPressed(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "AboutVCsegue", sender: sender)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "AboutVCsegue":
            // as? - try to convert segue.destination to AboutViewController - if it fail then return nil
            // as! - force to cast and unwrap - if failed crash the app - we are sure that it will NOT fail since segway points to AboutViewController in storyboard
            let aboutVC = segue.destination as! AboutViewController
            aboutVC.params = "Some params passed to About VC"
        case "SimpleDrawVCsegue":
            let simpleDrawVC = segue.destination as! SimpleDrawViewController
            simpleDrawVC.params = "Some params passed to Simple Draw VC"
        case "ErrorVCsegue":
            let errorVC = segue.destination as! ErrorHandlingViewController
            errorVC.params = "SOme params passwd to Error Handling VC"
        default:
            print("unrecognized segue identifier")
        }
    }
    
}

