//
//  UserData.swift
//  User Defaults
//
//  Created by Robert Kleniewski on 12/9/18.
//  Copyright © 2018 Robert Kleniewski. All rights reserved.
//

import Foundation

class UserData {
    var boolVal:  Bool   = false
    var floatVal: Float  = 0
    var textVal:  String = ""
    
    private let keyPrefix: String = "UserDara:"
    
    init(boolVal: Bool = false, floatVal: Float = 0.0, textVal: String = "") {
        self.boolVal  = boolVal
        self.floatVal = floatVal
        self.textVal  = textVal
    }
    
    func saveData() {
        UserDefaults.standard.set(self.boolVal,  forKey: keyPrefix + "boolVal")
        UserDefaults.standard.set(self.floatVal, forKey: keyPrefix + "floatVal")
        UserDefaults.standard.set(self.textVal,  forKey: keyPrefix + "textVal")
        _printKeys(message: "after saveData")
    }
    
    func loadData() -> Bool {
        var retVal: Bool = true
        
        let boolValOptional = UserDefaults.standard.object(forKey: keyPrefix + "boolVal")
        if let boolVal = boolValOptional as? Bool {
            self.boolVal = boolVal
        }
        else {
            retVal = false
        }
        
        let floatValOptional = UserDefaults.standard.object(forKey: keyPrefix + "floatVal")
        if let floatVal = floatValOptional as? Float {
            self.floatVal = floatVal
        }
        else {
            retVal = false
        }
        
        let textValOptional = UserDefaults.standard.object(forKey: keyPrefix + "textVal")
        if let textVal = textValOptional as? String {
            self.textVal = textVal
        }
        else {
            retVal = false
        }
        _printKeys(message: "after loadData")
        
        return retVal
    }
    
    func removeData() {
        let domain = Bundle.main.bundleIdentifier!
        UserDefaults.standard.removePersistentDomain(forName: domain)
        UserDefaults.standard.synchronize()
        _printKeys(message: "after removeData")
        // set default values
        self.boolVal = false
        self.floatVal = 0.0
        self.textVal = ""
    }
    
    private func _printKeys(message: String) {
        print("### Array of keys " + message)
        //print(Array(UserDefaults.standard.dictionaryRepresentation().keys).count)
        print(UserDefaults.standard.dictionaryRepresentation().keys)
        print("###")
    }
}
