//
//  RegisterView.swift
//  ToDoListApp
//
//  Created by Oleksandr on 29.11.2023.
//

import SwiftUI

struct RegisterView: View {
    
    var body: some View {
        VStack {
            HeaderView(title: "Register",
                        subtitle: "Start organizing todos",
                        angle: -15,		
                        backgroud: .orange)
            
            Form {
                TextField("Full name", text: $name)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                
                TextField("Email address", text: $email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                    .autocorrectionDisabled()
                
                TextField("Password", text: $passord)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                TLButton(tile: "Create account",
                         background: .blue
                ){
                    
                }
                .padding()
            }
            Spacer()
        }
    }
}


struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
