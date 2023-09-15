//
//  PlanListView.swift
//  YourPlanner
//
//  Created by Raeyoung Kim on 2023-09-12.
//

import FirebaseFirestoreSwift
import SwiftUI

struct PlanListView: View {
    
    //@StateObject var viewModel = PlanListViewViewModel()
    
    @StateObject var viewModel: PlanListViewViewModel
    
    @FirestoreQuery var items : [PlanListItem]
    
//    private let userId: String
    
    init(userId: String) {
//        self.userId = userId
        self._items = FirestoreQuery(
            collectionPath: "users/\(userId)/plans"
        )
        self._viewModel = StateObject(
            wrappedValue: PlanListViewViewModel(userId: userId)
        )
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List(items) { item in
                    PlanListItemView(item: item)
                        .swipeActions {
                            Button("Delete") {
                                viewModel.delete(id: item.id)
                            }
                            .tint(.red)
                        }
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("Your plans")
            .toolbar {
                Button {
                    // Action
                    viewModel.showingNewItemView = true
                    
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $viewModel.showingNewItemView) { // sheet -> Navigate to NewItemView
                NewItemView(newItemPresented: $viewModel.showingNewItemView)
            }
        }
    }
}

struct PlanListView_Previews: PreviewProvider {
    static var previews: some View {
        PlanListView(userId: "RIDoL2fbCyXR79QBFZAxXxibnwW2")
    }
}
