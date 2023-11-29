//
//  ContentView.swift
//  ToDoListApp
//
//  Created by Oleksandr on 28.11.2023.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        NavigationView {
            LoginView()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View{
        MainView()
    }
}
