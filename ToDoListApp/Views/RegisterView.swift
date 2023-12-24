//
//  RegisterView.swift
//  ToDoListApp
//
//  Created by Oleksandr on 29.11.2023.
//

import SwiftUI

struct RegisterView: View {
    @State var name = ""
    @State var email = ""
    @State var passord = ""
    
    var body: some View {
        VStack {
            HeaderView(title: "Register",
                        subtitle: "Start organizing todos",
                        angle: -15,		
                        backgroud: .orange)
            
            Form {
                TextField("Full name", text: $name)
                    .textFieldStyle(DefaultTextFieldStyle())
                TextField("Email address", text: $email)
                    .textFieldStyle(DefaultTextFieldStyle())
                TextField("Password", text: $passord)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                TLButton(tile: "Create account",
                         background: .blue
                ){
                    
                }
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
