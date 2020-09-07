//
//  Note.swift
//  Notes List
//
//  Created by  Mikhail on 09.05.2020.
//  Copyright © 2020  Mikhail. All rights reserved.
//

import Foundation

struct Note {
    
    var title : String
    var description : String
    
    static func createList() -> [Note] {
        var list : [Note] = []
        list.append(Note(title: "Shopping", description: "DL - tomorrow"))
        list.append(Note(title: "Washing", description: "Smells"))
        return list
    }
}
