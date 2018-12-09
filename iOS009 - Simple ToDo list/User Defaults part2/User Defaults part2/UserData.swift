//
//  UserData.swift
//  User Defaults part2
//
//  Created by Robert Kleniewski on 12/9/18.
//  Copyright © 2018 Robert Kleniewski. All rights reserved.
//

import Foundation

class UserData {
    private let _key: String = "dataItems"
    private var _dataBuf: [String] = []
    
    func loadDataToBuf() {
        let itemsOptional = UserDefaults.standard.object(forKey: _key)
        if let items = itemsOptional as? [String] {
            _dataBuf = items
        }
        else {
            _dataBuf = []
        }
    }
    
    func addDataItemToBuf(text: String) {
        _dataBuf.append(text)
    }
    
    func delDataItemFromBuf(index: Int) {
        _dataBuf.remove(at: index)
    }
    
    func getDataItemsCountInBuf() -> Int {
        var retVal: Int = 0
        retVal = _dataBuf.count
        return retVal
    }
    
    func getDataItemFromBuf(index: Int) -> String {
        var retVal: String = ""
        if index <= _dataBuf.count {
            retVal = _dataBuf[index]
        }
        else {
            retVal = ""
        }
        return retVal
    }
    
    func saveDataFromBuf() {
        UserDefaults.standard.set(_dataBuf, forKey: _key)
    }
}
