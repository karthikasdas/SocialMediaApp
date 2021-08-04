//
//  CommentDataSource.swift
//  SocialMediaApp
//
//  Created by Karthika on 8/3/21.
//

import Foundation
import UIKit
/*
 Data source for the comments table
Implements GenericDataSource which is the generic class containing a value to hold all the data
 Left side of cell shows the user name and right side comment posted by that user taken from the api
 */

class CommentDataSource : GenericDataSource<Comments>, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (feed_data.value.count > 0 ) ? feed_data.value.count : 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: profileCellIdentifier, for: indexPath) as! ProfileCell
        
        print("Data in here \(feed_data.value[0])")
        
        if feed_data.value.count > 0 {
            var name = feed_data.value[indexPath.row].name.components(separatedBy: " ")
            cell.contentText?.text = name.count > 2 ? name[0] + name[1] : name[0]
            cell.valueText.text = feed_data.value[indexPath.row].body
        }
//        if indexPath.row == self.feed_data.value[0].data.count - 1 { // last cell
            if indexPath.row == self.feed_data.value.count - 1 { // last cell
                NotificationCenter.default.post(name: Notification.Name(rawValue: commentNotificationKey), object: self)
//            }
        }
        return cell
    }
}
