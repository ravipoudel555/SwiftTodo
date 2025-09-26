//
//  TodoList.swift
//  SwiftTodo
//
//  Created by nex on 23/09/2025.
//

import SwiftUI
import SwiftData

struct TodoList: View {
    
    
    @Environment(\.modelContext) private var context
    
    @State private var showTodo = false
    @State private var selectedTodo: Todo? = nil
    @Query var todos:[Todo]
    var body: some View {
        
        NavigationStack{
            
            List{
                
                ForEach(todos){todo in
                    TodoCard(title: todo.title, notes:todo.notes)
                        .onTapGesture {
                            
                            selectedTodo = todo
                            showTodo = true
                            
                        }
                }
                .onDelete(perform: { indexSet in
                    for index in indexSet{
                        deleteTodo(todo: todos[index])
                    }
                })
                
                
                
            }.listStyle(.automatic)
                .navigationTitle("Todos")
                .toolbar{
                    ToolbarItem{
                        
                        Button("Add"){
                            selectedTodo = nil
                            showTodo = true
                            
                        }
                        
                    }
                }
                .navigationDestination(isPresented:$showTodo){
                    TodoForm(todo: selectedTodo)
                }
            
            Spacer()
        }
        
    }
    
    func deleteTodo (todo: Todo){
        context.delete(todo)
    }
}



#Preview {
    TodoList()
}
