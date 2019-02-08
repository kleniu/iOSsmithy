//
//  ViewController.swift
//  UISplitViewController
//
//  Created by Robert Kleniewski on 2/8/19.
//  Copyright © 2019 Robert Kleniewski. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController, UISplitViewControllerDelegate {
    
    var rows = [ "🐝 Row 0 (default)",
                 "🦊 Row 1" ]
    
    override func awakeFromNib() {
        super.awakeFromNib()
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
            return true
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // this will clear the table sellection only if Master View is the only visible view
        clearsSelectionOnViewWillAppear = splitViewController!.isCollapsed
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rows.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let myCell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "Cell")
        myCell.textLabel?.text = rows[ indexPath.row ]
        return myCell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            performSegue(withIdentifier: "Detail0", sender: indexPath.row)
        case 1:
            performSegue(withIdentifier: "Detail1", sender: indexPath.row)
        default:
            print("Unexpected case indexPath.row=\(indexPath.row)")
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "Detail0":
            var destinationVC = segue.destination
            // since we are sequeing into Navigation controller (not view controller) we have to extract VC from NavigationVC
            if let navVC = destinationVC as? UINavigationController {
                destinationVC = navVC.visibleViewController ?? navVC
            }
            if let detailVC = destinationVC as? DetailViewController0 {
                var title = ""
                if let titleIndex = sender as? Int {
                    title = rows[ titleIndex ]
                }
                detailVC.windowTitle = title
            }
        case "Detail1":
            var destinationVC = segue.destination
            // since we are sequeing into Navigation controller (not view controller) we have to extract VC from NavigationVC
            if let navVC = destinationVC as? UINavigationController {
                destinationVC = navVC.visibleViewController ?? navVC
            }
            if let detailVC = destinationVC as? DetailViewController1 {
                var title = ""
                if let titleIndex = sender as? Int {
                    title = rows[ titleIndex ]
                }
                detailVC.windowTitle = title
            }
        default:
            let segueName = segue.identifier ?? "N/A"
            print("Unexpected case segue.identifier=\(segueName)")
        }
    }

}

