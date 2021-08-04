//
//  CommentEndPoint.swift
//  SocialMediaApp
//
//  Created by Karthika on 8/3/21.
//

import Foundation
/*
For listing comments in the comments view
Implements Endpoint delegate
 */
enum CommentEndPoint {
    struct GetComments: Endpoint {
        typealias ModelType = Comment
        var baseURL: URL = URL(string: APIService.backendURL)!
        var verb: RequestVerb = .GET
        var pageRequired = true
        var path: String = "comments"
    }
  }
