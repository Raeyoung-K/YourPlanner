//
//  LoginViewViewModel.swift
//  YourPlanner
//
//  Created by Raeyoung Kim on 2023-09-12.
//

import FirebaseAuth
import Foundation

class LoginViewViewModel : ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init() {
        
    }
    
    func login() {
        
        guard validate() else {
            
            return
        }
        
        // Try log in
        
        Auth.auth().signIn(withEmail: email, password: password)
        
    }
    
    private func validate() -> Bool {
        
        errorMessage = ""   // reset error message
        
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
                !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            
            errorMessage = "Please fill in all fields"
            
            return false
        }
        
        // email@google.com
        
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Please enter valid email"
            return false
        }
        
        return true
        
    }
}
