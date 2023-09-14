//
//  User.swift
//  YourPlanner
//
//  Created by Raeyoung Kim on 2023-09-12.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}


