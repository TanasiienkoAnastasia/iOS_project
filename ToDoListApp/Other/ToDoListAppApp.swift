//
//  ToDoListAppApp.swift
//  ToDoListApp
//
//  Created by Oleksandr on 28.11.2023.
//

import FirebaseCore
import SwiftUI

@main
struct ToDoListAppApp: App {
    init(){
        FirebaseApp.configure();
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
