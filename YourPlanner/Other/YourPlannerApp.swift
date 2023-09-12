//
//  YourPlannerApp.swift
//  YourPlanner
//
//  Created by Raeyoung Kim on 2023-09-12.
//

import FirebaseCore
import SwiftUI

@main
struct YourPlannerApp: App {
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
