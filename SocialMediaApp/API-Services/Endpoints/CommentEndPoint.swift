//
//  CommentEndPoint.swift
//  SocialMediaApp
//
//  Created by Karthika on 8/3/21.
//

import Foundation
enum CommentEndPoint {
    struct GetComments: Endpoint {
        typealias ModelType = Comment
        var baseURL: URL = URL(string: APIService.backendURL)!
        var verb: RequestVerb = .GET
        var pageRequired = true
        var path: String = "comments"
    }
  }
