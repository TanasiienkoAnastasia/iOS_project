//
//  ToDoListView.swift
//  ToDoListApp
//
//  Created by Oleksandr on 29.11.2023.
//
import SwiftUI

struct ToDoListView: View {
    @StateObject var viewModel = ToDoListViewViewModel()
    
    private let userId: String
    init(userId: String) {
        self.userId = userId
    }
    var body: some View {
        NavigationView {
            VStack {
            }
            .navigationTitle("To Do List")
            .toolbar {
                Button {
                    // Action
                    viewModel.showingNewItemView = true
                } label: {
                    Image (systemName: "plus")
                }

            }
            .sheet(isPresented: $viewModel.showingNewItemView)
            {
                NewItemView(newItemPresented: $viewModel.showingNewItemView)
            }
        }
    }
}

struct ToDoListView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView(userId: "")
    }
}
