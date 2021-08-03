//
//  APIService.swift
//  SocialMediaApp
//
//  Created by Karthika on 8/2/21.
//

import Foundation

class APIService {
    
    static var backendURL : String {
        return "https://gorest.co.in/public-api/"
    }
    private let session: URLSession = URLSession(configuration: .default)
    private let decoder = JSONDecoder()
    
    public func call<T: Endpoint>(endpoint: T, completion: @escaping (Result<T.ModelType, Error>) -> ()) {
     
        let request = endpoint.request
        print("In call\(request)")
        session.dataTask(with: request) { data, response, error in
            guard error == nil else {
                _ = error! as NSError
                return completion(.failure(error!))
            }
            guard (response as? HTTPURLResponse) != nil else {
                return completion(.failure(error!))
            }
            guard let data = data else {
                return completion(.failure(error!))
            }
            DispatchQueue.main.async {
                            do {
                                let model = try self.decoder.decode(T.ModelType.self, from: data)
                                return completion(.success(model))
                            } catch {
                                print("Connection Error")
                            }                    
            }
        }.resume()
    }
}
