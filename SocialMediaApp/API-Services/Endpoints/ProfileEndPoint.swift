//
//  ProfileEndPoint.swift
//  SocialMediaApp
//
//  Created by Karthika on 8/3/21.
//

import Foundation
enum ProfileEndPoint {
    struct GetProfile: Endpoint {
        typealias ModelType = Profile
        var baseURL: URL = URL(string: APIService.backendURL)!
        var path: String = "users/{user_id}"
        var verb: RequestVerb = .GET
        var pageRequired = false
        
        init(userId:String) {
            self.path = path.replacingOccurrences(of: "{user_id}", with: userId)
        }
  }
}
