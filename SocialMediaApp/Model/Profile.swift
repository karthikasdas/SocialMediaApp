//
//  Profile.swift
//  SocialMediaApp
//
//  Created by Karthika on 8/3/21.
//

import Foundation

// MARK: - User
struct Profile: Codable {
    let data: User
}

// MARK: - User
struct User: Codable {
    let id: Int
    let name, email, gender, status: String
}
