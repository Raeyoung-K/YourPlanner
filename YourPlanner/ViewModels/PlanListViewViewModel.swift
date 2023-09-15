//
//  PlanListViewViewModel.swift
//  YourPlanner
//
//  Created by Raeyoung Kim on 2023-09-12.
//

import FirebaseFirestore
import Foundation

// viewModel for list of items view
// Primary tab
class PlanListViewViewModel :ObservableObject {
    
    @Published var showingNewItemView = false
    
    private let userId : String
    
    init(userId: String) {
        self.userId = userId
    }
    
    func delete(id: String) {
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userId)
            .collection("plans")
            .document(id)
            .delete()
    }
}
