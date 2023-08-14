//
//  LoginViewViewModel.swift
//  ToDoList
//
//  Created by Anshu Vij on 14/08/23.
//

import Foundation
import FirebaseAuth

class LoginViewViewModel : ObservableObject {
    
    @Published var email = ""
    @Published var pwd = ""
    @Published var errorMessage = ""
    
    init() {
        
    }
    
    func login() {
        
        guard validate() else {
            return
        }
        Auth.auth().signIn(withEmail: email, password: pwd)
        
    }
    
    private func validate() -> Bool {
        
        errorMessage = ""
        
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty, !pwd.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Please fill all the fields"
            return false
        }

        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Please enter valid email."
            return false
        }
        
        return true
    }
}
