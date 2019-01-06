//
//  Model.swift
//  View Controllers
//
//  Created by Robert Kleniewski on 1/1/19.
//  Copyright © 2019 Robert Kleniewski. All rights reserved.
//

import Foundation

class Emojis {
    var mydata: [ ( icon:String,
                            desc:String,
                            items: [ ( itemIcon: String,
                                       itemState: Bool)
                                   ] )
                        ] = [ ("😁","Faces",    [ ("😂", false), ("🤣", false), ("☺️", false), ("😊", false), ("😙", false), ("😎", false), ]),
                              ("🦁","Animals",  [ ("🐭", false), ("🦊", false), ("🐼", false), ("🦁", false), ("🐶", false), ("🐻", false), ]),
                              ("🍌","Food",     [ ("🍏", false), ("🍐", false), ("🍒", false), ("🥬", false), ("🌽", false), ("🥕", false), ]),
                              ("🏈","Activity", [ ("🏀", false), ("🏈", false), ("⚾️", false), ("🥎", false), ("🎾", false), ("🎱", false), ]),
                              ("🚙","Cars",     [ ("🚗", false), ("🚕", false), ("🚌", false), ("🚎", false), ("🏎", false), ("🚓", false), ]) ]
    
    var curGroupSelection: Int = 0
    
    func getCurrentGroupName() -> String {
        return mydata[curGroupSelection].desc
    }
    
    func getGroupName(index: Int) -> String {
        return mydata[index].icon + " - " + mydata[index].desc
    }
    
    func getGroupSelections(index: Int) -> Int {
        var retVal = 0
        var items = mydata[index].items
        
        for i in 0..<items.count {
            if items[i].itemState {
                retVal += 1
            }
        }
        
        return retVal
    }
    
    func getGroupCount() -> Int {
        return mydata.count
    }
    
}
