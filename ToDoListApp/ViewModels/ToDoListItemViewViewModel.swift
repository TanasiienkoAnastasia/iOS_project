//
//  ToDoListItemViewViewModel.swift
//  ToDoListApp
//
//  Created by Oleksandr on 29.11.2023.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation


class ToDoListItemViewViewModel: ObservableObject {
    
    init(){
        
    }
    
    func toggleIsDone(item: ToDoListItem){
         var copyItem = item
        copyItem.setDone(!item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        let db = Firestore.firestore()
        db.collection("users")
            .document (uid)
            .collection("todos")
            .document(copyItem.id)
            .setData(copyItem.asDictionary())
        
    }
}
