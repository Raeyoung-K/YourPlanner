//
//  PlanItem.swift
//  YourPlanner
//
//  Created by Raeyoung Kim on 2023-09-12.
//

import Foundation

struct PlanListItem : Codable, Identifiable {
    let id: String
    let title: String
    let dueDate: TimeInterval
    let createdDate: TimeInterval
    var isDone: Bool
    
    mutating func setDone(_ state: Bool) {
        isDone = state
    }
}
