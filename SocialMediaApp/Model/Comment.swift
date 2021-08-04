//
//  Comment.swift
//  SocialMediaApp
//
//  Created by Karthika on 8/3/21.
//

import Foundation
// MARK: - Welcome
struct Comment: Codable {
    let code: Int
    let data: [Comments]
    let meta: Meta
}

// MARK: - Datum
struct Comments: Codable {
    let id, postID: Int
    let name, email, body: String

    enum CodingKeys: String, CodingKey {
        case id
        case postID = "post_id"
        case name, email, body
    }
}

