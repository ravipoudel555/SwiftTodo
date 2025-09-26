//
//  Todo.swift
//  SwiftTodo
//
//  Created by nex on 23/09/2025.
//

import SwiftData


@Model
class Todo{
    var title: String
    var notes: String
    

    init( title: String, notes: String) {
        self.title = title
        self.notes = notes
    }
}

