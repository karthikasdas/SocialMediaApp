//
//  ProfileViewModel.swift
//  SocialMediaApp
//
//  Created by Karthika on 8/3/21.
//

import Foundation
/*
 To call the api for profile view
 */
struct ProfileViewModel {
    weak var profileSource:ProfileDataSource!
    var api_service:APIService!
    init(service: APIService = APIService(), dataSource : ProfileDataSource) {
        self.profileSource = dataSource
        self.api_service = service
    }
   
    mutating func fetchProfileList(of user:String) {
        self.api_service = APIService()
        api_service.call(endpoint: ProfileEndPoint.GetProfile(userId: user))  {
            [self] result in
            print("Profile Resut \(result)")

                switch result {
                case let .success(Profile):
                        DispatchQueue.main.async {
                            profileSource?.feed_data.value = [Profile.data]
                        }
                    
                case .failure:
                    DispatchQueue.main.async {
                        
                    }
                }
        }
    }
}
