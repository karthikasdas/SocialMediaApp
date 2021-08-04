//
//  Endpoint.swift
//  SocialMediaApp
//
//  Created by Karthika on 8/2/21.
//

import Foundation

/*
 baseURL - bckend main URL
 path -  any additional path from base
 verb - kind of request (In this app only get is used)
 pageRequired - to check for pagination
 Endpoint extended to add and modify url request
 */
protocol Endpoint {
    associatedtype ModelType: Decodable
    
    var baseURL: URL { get }
    var path: String { get }
    var verb: RequestVerb { get }
    var pageRequired:Bool { get }
    
}

enum RequestVerb: String {
    case GET
}

extension Endpoint {
    var request: URLRequest {
        var request = URLRequest(url: baseURL)
        request.httpMethod = verb.rawValue
        request.url = baseURL.appendingPathComponent(path)
        
        switch verb {
        case .GET:
            if var urlComponents = URLComponents(url: baseURL.appendingPathComponent(path), resolvingAgainstBaseURL: false) {
                if(pageRequired) {
                    urlComponents.queryItems = [URLQueryItem(name: "page", value: "1")]
                }
                request.url = urlComponents.url
            }
        }
        return request
    }
}
