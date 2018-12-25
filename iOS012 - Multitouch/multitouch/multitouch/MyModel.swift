//
//  MyModel.swift
//  multitouch
//
//  Created by Robert Kleniewski on 12/23/18.
//  Copyright © 2018 Robert Kleniewski. All rights reserved.
//

import Foundation

struct MyModel {
    
    // (A) FacesTypes has rawValue of String and implements CaseIterable protocol
    // since now .allCases method can be use to get array of all cases
    enum FacesTypes: String, CaseIterable {
        case dog    = "🐶"
        case cat    = "🐱"
        case mouse  = "🐭"
        case rabbit = "🐰"
        case fox    = "🦊"
        case bear   = "🐻"
        case lion   = "🦁"
        case cow    = "🐮"
        case monkey = "🐵"
        
        // methods inside enums - awesome :)
        static func pickRandomFace() -> FacesTypes {
            let allCases = self.allCases
            return allCases[Int(arc4random_uniform(UInt32(allCases.count)))]
        }
    }
    
    private var _facesArray: [FacesTypes] = []
    private var _facesCurIndex: Int = 0
    
    private mutating func _createArrayOfFaces(items: Int) {
        _facesArray = []
        for _ in 0..<items {
            _facesArray.append(FacesTypes.pickRandomFace())
        }
    }
    
    init(size: Int) {
        _createArrayOfFaces(items: size)
    }
    
    func getCurrent() -> FacesTypes {
        return _facesArray[_facesCurIndex]
    }
    
    mutating func getNext() -> FacesTypes {
        _facesCurIndex += 1
        if _facesCurIndex >= _facesArray.count {
            _facesCurIndex = 0
        }
        return _facesArray[_facesCurIndex]
    }
    
    mutating func getPrev() -> FacesTypes {
        _facesCurIndex -= 1
        if _facesCurIndex < 0 {
            _facesCurIndex = _facesArray.count - 1
        }
        return _facesArray[_facesCurIndex]
    }
    
}
