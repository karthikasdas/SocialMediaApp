//
//  CommentViewModel.swift
//  SocialMediaApp
//
//  Created by Karthika on 8/3/21.
//

import Foundation
struct CommentViewModel {
    weak var commentSource:CommentDataSource!
    var api_service:APIService!
    init(service: APIService = APIService(), dataSource : CommentDataSource) {
        self.commentSource = dataSource
        self.api_service = service
    }
   
    mutating func fetchCommentList() {
        self.api_service = APIService()
        api_service.call(endpoint: CommentEndPoint.GetComments())  {
            [self] result in
            print("Resut profile \(result)")
                switch result {
                case let .success(Comment):
                        DispatchQueue.main.async {
                            commentSource?.feed_data.value = Comment.data
                        }
                case .failure:
                    DispatchQueue.main.async {
                        
                    }
                }
        }
    }
}
