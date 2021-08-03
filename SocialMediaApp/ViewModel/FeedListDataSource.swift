//
//  FeedListDataSource.swift
//  SocialMediaApp
//
//  Created by Karthika on 8/2/21.
//

import Foundation
import UIKit

class GenericDataSource<T> : NSObject {
    var feed_data: CommonValue<[T]> = CommonValue([])
//    var profile_data:CommonValue<[T]> = CommonValue([])
}

class FeedListDataSource : GenericDataSource<ListOfFeed>, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return feed_data.value.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: feedListCellIdentifier, for: indexPath) as! FeedListCell
        cell.cellData = self.feed_data.value[indexPath.section] as ListOfFeed
        return cell
    }
    
}
