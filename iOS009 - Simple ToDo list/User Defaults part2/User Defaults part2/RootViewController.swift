//
//  ViewController.swift
//  User Defaults part2
//
//  Created by Robert Kleniewski on 12/9/18.
//  Copyright © 2018 Robert Kleniewski. All rights reserved.
//

import UIKit


// Don't forget to drag and drop from TableView to RootViewController and picked Delegate and DataSource
class RootViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var userData: UserData = UserData()
    @IBOutlet weak var tableView: UITableView! // this is needed to reload data
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        userData.loadDataToBuf()
        return userData.getDataItemsCountInBuf()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        userData.loadDataToBuf()
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "cell")
        cell.textLabel?.text = userData.getDataItemFromBuf(index: indexPath.row)
        return cell
    }
    
    // just by adding this function we can remove row by swaping left and pressing delete red button
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            userData.delDataItemFromBuf(index: indexPath.row)
            userData.saveDataFromBuf()
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // dont't have to do this since I did drag and drop from TableView to RootViewController and picked Delegate and DataSource
        // tableView.delegate = self
        // tableView.dataSource = self
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
    }

    @IBAction func addItemButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "addItemViewSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addItenViewSegue" {
            let addItemVC = segue.destination as! AddItemViewController
            addItemVC.viewParam = "Simple param passed to AddItemViewController"
        }
    }
}

