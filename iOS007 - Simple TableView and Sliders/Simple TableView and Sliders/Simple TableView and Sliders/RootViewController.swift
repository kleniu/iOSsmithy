//
//  RootViewController.swift
//  Simple TableView and Sliders
//
//  Created by Robert Kleniewski on 12/8/18.
//  Copyright © 2018 Robert Kleniewski. All rights reserved.
//

import UIKit

class RootViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let lineText: [String] = ["1. First", "2. Second", "3. Third", "2. Fourth", "5. Fifth",
                              "6. Sixth", "7. Seventh", "8. Eighth", "9. Ninth", "10. Tenth",
                              "11. Eleventh", "12. Twelfth", "13. Thirteenth", "14. Fortnight", "15. Fifteenth",
                              "16. Sixteenth", "17. Seventeenth", "18. Eighteenth", "19. Nineteenth", "20. Twentieth"]
    
    // this function must return the number of rows i the table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lineText.count
    }
    
    // this function must return cell for the specified position. Position start with index=0
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default,
                                   reuseIdentifier: "protoCell") // "protoCell" is the identifier in the atributes of prototype cell
        cell.textLabel?.text = lineText[indexPath.row]
        return cell
    }
    
    // the tableView cell has been clicked
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Raw clicked: \(indexPath.row)")
        performSegue(withIdentifier: "selectionViewSeque", sender: indexPath.row)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "selectionViewSeque" {
            let selectionVC = segue.destination as! SelectionViewController
            selectionVC.clickedItem = sender as! Int
            selectionVC.sliderValue = slider.value
        }
    }

    @IBOutlet weak var slider: UISlider!
    
    @IBAction func sliderValueChanged(_ sender: Any) {
        print("Slider value: \(slider.value)")
    }
    
    @IBOutlet weak var table: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

