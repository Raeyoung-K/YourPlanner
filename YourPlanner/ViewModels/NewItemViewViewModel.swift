//
//  NewItemViewViewModel.swift
//  YourPlanner
//
//  Created by Raeyoung Kim on 2023-09-12.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

class NewItemViewViewModel :ObservableObject {
    
    @Published var title = ""
    @Published var dueDate = Date()
    @Published var showAlert = false
    
    init() {
        
    }
    
    func save() {
        guard canSave else {
            return
        }
        
        // Get current user id
        guard let uId = Auth.auth().currentUser?.uid else {
            return
        }
        
        // Create model
        let newId = UUID().uuidString
        
        let newItem = PlanListItem(
            id: newId,
            title: title,
            dueDate: dueDate.timeIntervalSince1970,
            createdDate: Date().timeIntervalSince1970,
            isDone: false)
        
        
        // Save model to database
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(uId)
            .collection("plans")
            .document(newId)
            .setData(newItem.asDictionary())
        
    }
    
    var canSave : Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else { // title should not be empty
            return false
        }
        
        guard dueDate >= Date().addingTimeInterval(-86400) else {
            return false
        }
        
        return true
    }
}
