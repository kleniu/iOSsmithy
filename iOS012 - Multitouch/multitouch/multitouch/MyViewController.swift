//
//  ViewController.swift
//  multitouch
//
//  Created by Robert Kleniewski on 12/23/18.
//  Copyright © 2018 Robert Kleniewski. All rights reserved.
//

import UIKit

class MyViewController: UIViewController {
    
    // Here is the connection between Controller and Model
    var myFaces = MyModel(size: 5)
    
    // Here is the connection between Controller and View
    @IBOutlet weak var myView: MyView! {
        didSet {
            // because swipe affects Model we have to set target to Controller (self)
            let myRightSwap = UISwipeGestureRecognizer(target: self, action: #selector(switchRightFace))
            // we need to configure gesture
            myRightSwap.direction = [ .right ] // will start selector on right swipe
            // asking myView to recognize this gesture
            myView.addGestureRecognizer(myRightSwap)
            
            // do the same for left swipe
            let myLeftSwap = UISwipeGestureRecognizer(target: self, action: #selector(switchLeftFace))
            myLeftSwap.direction = [ .left ] // will start selector on left swipe
            myView.addGestureRecognizer(myLeftSwap)
        }
    }
    
    @objc func switchRightFace() {
        myView.myEmoji = myFaces.getNext().rawValue
    }
    
    @objc func switchLeftFace() {
        myView.myEmoji = myFaces.getPrev().rawValue
    }
    
    // this gesture has been added via storyboard - it’s more convenient way to add gestures
    @IBAction func resizeFace(_ sender: UIPinchGestureRecognizer) {
        switch sender.state {
        case .changed, .ended:
            myView.mySize = myView.mySize * sender.scale
            sender.scale = 1.0 // we need to reset scale to not resize face expotentially
        default:
            break
        }
    }
    
    @IBAction func hideFace(_ sender: UITapGestureRecognizer) {
        switch sender.state {
        case .ended:
            if myView.myEmoji == "😎" {
                myView.myEmoji = myFaces.getCurrent().rawValue
            }
            else {
                myView.myEmoji = "😎"
            }
        default:
            break
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print(MyModel.FacesTypes.allCases)
        for i in 0..<20 {
            let randomFace = MyModel.FacesTypes.pickRandomFace()
            print("\(i)) random face \(randomFace) - with rawValue \(randomFace.rawValue)")
        }
        // let's print current face at index 0 and then 4 next faces
        print("Forward order")
        print(myFaces.getCurrent().rawValue)
        for _ in 1..<5 {
            print(myFaces.getNext().rawValue)
        }
        // now the index points to count-1
        print("Backward order")
        print(myFaces.getCurrent().rawValue)
        for _ in 1..<5 {
            print(myFaces.getPrev().rawValue)
        }
        
        // show the current face in the view
        myView.myEmoji = myFaces.getCurrent().rawValue
    }


    
    
    
}

