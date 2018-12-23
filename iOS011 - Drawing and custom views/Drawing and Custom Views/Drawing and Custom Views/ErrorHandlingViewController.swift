//
//  ErrorHandlingViewController.swift
//  Drawing and Custom Views
//
//  Created by Robert Kleniewski on 12/18/18.
//  Copyright © 2018 Robert Kleniewski. All rights reserved.
//

import UIKit

class ErrorHandlingViewController: UIViewController {

    var params = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print("Starting test1")
        // TEST1
        do {
            var returned = ""
            try returned = checkVal(for: 6) // it will be OK
            print("returned: \(returned)")
            try returned = checkVal(for: 3) // it will throw
            print("returned: \(returned)")  // this will not be executed because previous line throws error
            try returned = checkVal(for: 4) // this will not be executed because previous line throws error
        } catch let error { // if something throws then I must catch it
            print("caught error: \(error) ") // it will display "caught error: valueTooLow(minVal: 5)"
        }
        
        print("Starting test2")
        // TEST2
        // .. or you can conditionally try, converting the return into an Optional (which can be nil if fail)
        let x = try? checkVal(for: 10) // x will be optional String - a.k.a String?
        print("returned: \(x!)") // x! will foce unwrap the optional
        let y = try? checkVal(for: 1) // y will be String?=nil
        if let unwrappedY = y {
           print("You will never see this line. \(unwrappedY)")
        } else {
            print("y is nil")
        }
        
        print("Starting test3")
        // TEST 3
        // it will crash program with info in Xcode if you incomment line "try! ...."
        // "Thread 1: Fatal error: 'try!' expression unexpectedly raised an error: Drawing_and_Custom_Views.ErrorHandlingViewController.MyErrors.valueTooLow(minVal: 5)"
        var z = ""
        // try! z = checkVal(for: 2)
        z = "returned value = " + z
        print("z=\(z)")
        
    }
    
    // lets create the enum with my custom errors - it must implement (empty) protocol "error"
    enum MyErrors: Error {
        case invalidSelection
        case valueTooLow(minVal: Int) // read as this: define an enumeration type "MyErrors"
                                      //   which can also take a value "valueTooLow"
                                      //   with associated value "minVal" of type "Int"
        case unsuportedTask
    }
    
    // func that throws
    func checkVal(for myVal: Int) throws -> String {
        var retVal = ""
        
        if myVal < 5 {
            throw MyErrors.valueTooLow(minVal: 5)
        } else {
            print("Value \(myVal) is checked and it's perfect.")
            retVal = "OK"
        }
        
        return retVal
    }

}
