//
//  SwiftTodoApp.swift
//  SwiftTodo
//
//  Created by nex on 23/09/2025.
//

import SwiftUI
import SwiftData

@main
struct SwiftTodoApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Todo.self)
    }
}
