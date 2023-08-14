//
//  RegisterViewViewModel.swift
//  ToDoList
//
//  Created by Anshu Vij on 14/08/23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class RegisterViewViewModel : ObservableObject {
    
    @Published var name = ""
    @Published var email = ""
    @Published var pwd = ""
    
    init() {
        
    }
    
    func register() {
        
        guard validate() else {
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: pwd) { [weak self] result, error in
            guard let userId = result?.user.uid else {
                return
            }
            
            self?.insertUserRecored(id: userId)
            
        }
        
    }
    
    private func insertUserRecored(id : String)
    {
        let newUser = User(id: id, name: name, email: email, joined: Date().timeIntervalSince1970)
        
        let db = Firestore.firestore()
        db.collection("users").document(id).setData(newUser.asDictionary())
        
        
    }
    
    private func validate() -> Bool {
        
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty, !pwd.trimmingCharacters(in: .whitespaces).isEmpty && !name.trimmingCharacters(in: .whitespaces).isEmpty else {
           // errorMessage = "Please fill all the fields"
            return false
        }

        guard email.contains("@") && email.contains(".") else {
           // errorMessage = "Please enter valid email."
            return false
        }
        
        guard pwd.count >= 6  else {
            return false
        }
        
        return true
    }
    
}
