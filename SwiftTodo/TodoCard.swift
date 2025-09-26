//
//  TodoCard.swift
//  SwiftTodo
//
//  Created by nex on 23/09/2025.
//

import SwiftUI

struct TodoCard: View {
    var title : String
    var notes : String
    var body: some View {
        VStack(alignment:.leading, spacing: 15){
            Text(title)
                .font(.title2)
            Text(notes)
        }
        .padding(10)

//        .background(
//            RoundedRectangle(cornerRadius: 10)
//                .fill(Color(.red))
//                .opacity(0.1)
//            
//        )
       
        
    }
}

#Preview {
    TodoCard(title: "Test Title", notes: "Test Note")
}
