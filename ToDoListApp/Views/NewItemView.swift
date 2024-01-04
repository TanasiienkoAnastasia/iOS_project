//
//  NewItemView.swift
//  ToDoListApp
//
//  Created by Oleksandr on 29.11.2023.
//

import SwiftUI
struct NewItemView: View {
    @StateObject var viewModel = NewItemViewViewModel()
    
    @Binding var newItemPresented: Bool
    var body: some View {
        VStack {
            Text("New Item")
                .font(.system (size: 32))
                .bold()
                .padding()
            
            Form{
                TextField("Title", text: $viewModel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                DatePicker("Due Date", selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                
                TLButton(tile: "Save", background: .pink)
                {
                    if viewModel.canSave{
                        viewModel.save()
                        newItemPresented = false
                    }else{
                        viewModel.showAlert = true
                    }
                    
                }
                .padding()
            }
            .alert(isPresented: $viewModel.showAlert){
                Alert(title: Text("Error"),
                      message: Text("Pleas fill in all fieslds and select newer date"))
                                
            }
        }
    }
}
struct NewItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewItemView(newItemPresented: Binding(get: {return true}  , set: {_ in}))
    }
}
