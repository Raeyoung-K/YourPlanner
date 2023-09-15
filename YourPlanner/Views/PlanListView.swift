//
//  PlanListView.swift
//  YourPlanner
//
//  Created by Raeyoung Kim on 2023-09-12.
//

import SwiftUI

struct PlanListView: View {
    
    @StateObject var viewModel = PlanListViewViewModel()
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
    }
    
    var body: some View {
        NavigationView {
            VStack {
                
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
        PlanListView(userId: "")
    }
}
