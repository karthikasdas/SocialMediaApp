//
//  Comment.swift
//  SocialMediaApp
//
//  Created by Karthika on 8/3/21.
//

import Foundation
// MARK: - Comment
/*
 Struct that mimics backend json keys for Comment list
 */
struct Comment: Codable {
    let code: Int
    let data: [Comments]
    let meta: Meta
}

// MARK: - Comments
struct Comments: Codable {
    let id, postID: Int
    let name, email, body: String

    enum CodingKeys: String, CodingKey {
        case id
        case postID = "post_id"
        case name, email, body
    }
}

