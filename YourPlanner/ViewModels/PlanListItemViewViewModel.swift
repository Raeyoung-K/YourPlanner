//
//  PlanListItemViewViewModel.swift
//  YourPlanner
//
//  Created by Raeyoung Kim on 2023-09-12.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

// viewModel for a single plan item view

class PlanListItemViewViewModel :ObservableObject {
    init() {
        
    }
    
    func toggleIsDone(item: PlanListItem) {
        var newItem = item
        newItem.setDone(!item.isDone) // should be inverse
        
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(uid)
            .collection("plans")
            .document(newItem.id)
            .setData(newItem.asDictionary())
    }
}
