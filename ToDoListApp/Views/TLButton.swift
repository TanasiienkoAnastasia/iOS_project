//
//  TLButton.swift
//  ToDoListApp
//
//  Created by Oleksandr on 24.12.2023.
//

import SwiftUI

struct TLButton: View {
    
    let tile: String
    let background: Color
    let action: () -> Void
    
    var body: some View {
        Button {
            
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(background)
                
                Text(tile)
                    .foregroundColor(Color.white)
                    .bold()
            }
        }
    }
}

struct TLButton_Previews: PreviewProvider {
    static var previews: some View {
        TLButton(tile: "Value",
                 background: .pink){
            
        }
    }
}
