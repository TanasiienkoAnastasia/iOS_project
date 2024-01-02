//
//  RegisterViewViewModel.swift
//  ToDoListApp
//
//  Created by Oleksandr on 29.11.2023.
//
import FirebaseFirestore
import FirebaseAuth
import Foundation

class RegisterViewViewModel: ObservableObject {
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    
    init() {}
    
    func register() {
        guard validate() else {
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            guard let userId = result?.user.uid else{
                return
            }
            
            self?.insertUserRecord(id: userId)
        }
    }
    
    private func insertUserRecord(id: String) {
        let newUser = User(id: id,
                           name: name,
                           email: email,
                           joined: Date().timeIntervalSince1970)
        
        let db = Firestore.firestore()
        
        
        
        db.collection("users").whereField("email", isEqualTo: email).getDocuments { [weak self] (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
                return
            } else if querySnapshot!.documents.isEmpty {
                self?.createFirebaseUser()
            } else {
                print("User already exists with this email")
            }
        }
    }
    
    private func createFirebaseUser() {
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            guard let userId = result?.user.uid, error == nil else {
                print("Error creating user: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            
            self?.insertUserRecord(id: userId)
        }
    }
    
    private func validate() -> Bool {
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty,
              !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
    }
    
    guard email.contains("@") && email.contains(".") else {
        return false
    }
    
    guard password.count >= 6 else {
        return false
    }
    return true
    }
}

