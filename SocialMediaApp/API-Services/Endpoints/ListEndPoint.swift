//
//  ListEndPoint.swift
//  SocialMediaApp
//
//  Created by Karthika on 8/2/21.
//

import Foundation

enum ListEndpoint {
    struct GetFeed: Endpoint {
        typealias ModelType = FeedList
        var baseURL: URL = URL(string: APIService.backendURL)!
        var path: String = "posts"
        var verb: RequestVerb = .GET
        var pageRequired = true
        
        init(pageNumber:String) {
            
        }
  }
}
