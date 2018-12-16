//
//  RootViewController.swift
//  WebView and GET method
//
//  Created by Robert Kleniewski on 12/12/18.
//  Copyright © 2018 Robert Kleniewski. All rights reserved.
//

import UIKit

class RootViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let testList: [(labelText:String,segueName:String)] = [ ("1) Simple WEB browser.","WebViewSegue"),
                                                            ("2) Simple REST API GET request", "WeatherViewSegue") ]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return testList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let currentCell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "myCell")
        currentCell.textLabel?.text = testList[indexPath.row].labelText
        return currentCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Pressed row# \(indexPath.row) for: '\(testList[indexPath.row].labelText)'")
        performSegue(withIdentifier: testList[indexPath.row].segueName, sender: nil)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    @IBAction func AboutButtonPressed(_ sender: Any) {
        print("About Button pressed on Root View")
        
        performSegue(withIdentifier: "AboutViewSegue", sender: nil)
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier! {
        case "AboutViewSegue":
            let aboutVC = segue.destination as! AboutViewController
            aboutVC.viewParameters = "Sample parameters passed from Root View to About View"
        case "WebViewSegue":
            let webVC = segue.destination as! WebViewController
            webVC.viewParameters = "Sample parameters passed from Root View to Web View"
        case "WeatherViewSegue":
            let weatherVC = segue.destination as! WeatherViewController
            weatherVC.viewParameters = "Sample parameters passed from Root View to Web View"
        default:
            print("Unknown seque identifier. Ignoring.")
        }
    }
    
}

