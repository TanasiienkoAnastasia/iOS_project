//
//  LoginView.swift
//  ToDoListApp
//
//  Created by Oleksandr on 29.11.2023.
//

import SwiftUI

struct LoginView: View {
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        VStack {
            HeaderView(title: "To Do List",
                       subtitle: "Get things done",
                       angle: 15,
                       backgroud: .green)
            
            Form {
                TextField("Email Address",
                          text: $email)
                .textFieldStyle(DefaultTextFieldStyle())
                
                SecureField("Password",
                            text: $password)
                .textFieldStyle(DefaultTextFieldStyle())
                
                TLButton(tile: "Log In",
                         background: .green
                ){
                    
                }
                
                
            }
            
            .offset(y: -50)
            
            VStack {
                Text("New around her?")
                
                NavigationLink("Create an acount",
                               destination: RegisterView())
            }
        }
        .padding(.bottom, 50)
        
        Spacer()
    }
}


struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
