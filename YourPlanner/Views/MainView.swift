//
//  ContentView.swift
//  YourPlanner
//
//  Created by Raeyoung Kim on 2023-09-12.
//

import SwiftUI

struct MainView: View {
    
    @StateObject var viewModel = MainViewViewModel()
    
    var body: some View {
        
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty {
            // already signed in
            PlanListItemView()
            
        } else {
            LoginView()
        }
        
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
