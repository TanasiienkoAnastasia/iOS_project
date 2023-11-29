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
                
                Button {
                    
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(Color.blue)
                        
                        Text("Log In")
                            .foregroundColor(Color.white)
                            .bold()
                    }
                }
                .padding()
            }
            
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
