//
//  FeedListViewModel.swift
//  SocialMediaApp
//
//  Created by Karthika on 8/2/21.
//

import Foundation
import UIKit

/*
 Used to call the feed api to get the feed list
 */

struct FeedListViewModel {
    weak var feedSource:FeedListDataSource!
    var api_service:APIService!
    
    init(service: APIService = APIService(), dataSource : FeedListDataSource) {
        self.feedSource = dataSource
        self.api_service = service
    }
   
    mutating func fetchFeedList(of page:String,spinner : SpinnerController,view:UIViewController) {
        self.api_service = APIService()
        api_service.call(endpoint: ListEndpoint.GetFeed(pageNumber: page))  {
            [self] result in
            print("Resut \(result)")
                switch result {
                case let .success(FeedList):
                        DispatchQueue.main.async {
                            spinner.willMove(toParent: nil)
                            spinner.view.removeFromSuperview()
                            spinner.removeFromParent()
                            if(feedSource?.feed_data.value.count == 0){
                                feedSource?.feed_data.value = FeedList.data
                            }
                            else{
                                feedSource?.feed_data.value.append(contentsOf: FeedList.data)
                            }
                        }
                    
                case .failure:
                    DispatchQueue.main.async {
                        spinner.willMove(toParent: nil)
                        spinner.view.removeFromSuperview()
                        spinner.removeFromParent()
                        let alertC = AlertController()
                        alertC.showAlert(view: view, msg: "Error loading Data. Check your connection")
                    }
                }
        }
    }
    
    
}
