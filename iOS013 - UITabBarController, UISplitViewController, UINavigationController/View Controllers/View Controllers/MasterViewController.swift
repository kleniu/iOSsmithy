//
//  MasterViewController.swift
//  View Controllers
//
//  Created by Robert Kleniewski on 1/1/19.
//  Copyright © 2019 Robert Kleniewski. All rights reserved.
//

import UIKit

class MasterViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISplitViewControllerDelegate {

    @IBOutlet weak var myTableView: UITableView!
    
    var myModel: Emojis = Emojis()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myModel.getGroupCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let myCell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "Prototype Cell")
        myCell.textLabel?.text = myModel.getGroupName(index: indexPath.row) + " (\(myModel.getGroupSelections(index: indexPath.row)))"
        return myCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        myModel.curGroupSelection = indexPath.row
        performSegue(withIdentifier: "ShowDetailSegue", sender: myModel)
    }
    
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowDetailSegue" {
            let myDetailVC = segue.destination as! DetailViewController
            if let unwrapperSender = sender {
                myDetailVC.myModelOptional = unwrapperSender as? Emojis
                myDetailVC.myTableViewOptional = myTableView
            }
        }
     }
 
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        myTableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    // when starting up iPhone version of splitViewController app, the app starts with detailed view.
    // let's force to startup with matser view using delegation of SplitViewController
    // it will work on iPhone <= 8 ONLY :( !!!!!!!!!!!! unless you do mySplitVC.preferredDisplayMode = UISplitViewController.DisplayMode.allVisible :)
    override func awakeFromNib() {
        splitViewController?.delegate = self
        if let mySplitVC = splitViewController {
          mySplitVC.preferredDisplayMode = UISplitViewController.DisplayMode.allVisible
        }
    }
    
    // This method is your opportunity to perform any necessary tasks related to the transition to a collapsed interface. After this method returns, the split view controller removes the secondary view controller from its viewControllers array, leaving the primary view controller as its only child.
    func splitViewController(_ splitViewController: UISplitViewController,
                             collapseSecondary secondaryViewController: UIViewController, // this is detail view controller
                             onto primaryViewController: UIViewController) // this is master view controller
        -> Bool {
            print("** Inside: splitViewController(..)")
            if let myDetailVC = secondaryViewController as? DetailViewController {
                if myDetailVC.myModelOptional == nil {
                    print("I collapsed secondary (detail) view.")
                    return true
                }
            }
            print("I did nothing - take care of collapsing Mr. iOS.")
            return false // i did not do it, so you should colapse it
    }
    

}
