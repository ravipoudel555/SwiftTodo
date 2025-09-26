//
//  TodoForm.swift
//  SwiftTodo
//
//  Created by nex on 23/09/2025.
//

import SwiftUI




struct TodoForm: View {
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    @State  private var title=""
    @State private var notes = ""
    @State private var  showAlert = false
    
    var todo: Todo?
    
    var body: some View {
        
        NavigationStack{
            Form{
                
                Section{
                    
                    VStack(alignment: .leading){
                        Text("Title")
                        TextField("Add todo title", text: $title)
                    }
                    
                    VStack(alignment: .leading){
                        Text("Notes")
                        TextEditor( text: $notes).frame(height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                    }
                    
                    
                }
                
                
                
                
            }.navigationTitle(todo == nil ? "Add Todo" : "Edit Todo")
                .toolbar{
                    
                    
                    ToolbarItem(id: "save", placement: .confirmationAction) {
                        Button ("Save"){
                            if(isFormValid()){
                                if let existingTodo = todo {
                                    // Update existing todo
                                    existingTodo.title = title
                                    existingTodo.notes = notes
                                } else {
                                    // Create new todo
                                    let newTodo = Todo(title: title, notes: notes)
                                    context.insert(newTodo)
                                }
                                dismiss()
                            }
                            else{
                                showAlert = true
                            }
                            
                        }
                    }
                }
                .alert("Invalid Input", isPresented: $showAlert){
                    Button("OK", role: .cancel) {}
                }message: {
                    Text("Please fill out both Title and Notes before saving.")
                }
                .onAppear{
                    if let todo = todo{
                        title = todo.title
                        notes = todo.notes
                    }
                }
        }
        
    }
    
    func isFormValid ()-> Bool{
        return  !title.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty &&
        !notes.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}

#Preview {
    TodoForm()
}
