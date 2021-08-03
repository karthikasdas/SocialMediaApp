//
//  FeedList.swift
//  SocialMediaApp
//
//  Created by Karthika on 8/2/21.
//

import Foundation

// MARK: - FeedList
struct FeedList: Codable {
    let code: Int
    let meta: Meta
    let data: [ListOfFeed]
    
}

// MARK: - ListOfFeed
struct ListOfFeed: Codable {
    let id, userID: Int
    let title, body: String

    enum CodingKeys: String, CodingKey {
        case id
        case userID = "user_id"
        case title, body
    }
}

// MARK: - Meta
struct Meta: Codable {
    let pagination: Pagination
}

// MARK: - Pagination
struct Pagination: Codable {
    let total, pages, page, limit: Int
}

