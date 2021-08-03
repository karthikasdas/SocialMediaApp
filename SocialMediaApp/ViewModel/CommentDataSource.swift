//
//  CommentDataSource.swift
//  SocialMediaApp
//
//  Created by Karthika on 8/3/21.
//

import Foundation
import UIKit

class CommentDataSource : GenericDataSource<Comments>, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.feed_data.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: profileCellIdentifier, for: indexPath) as! ProfileCell
        
        print("Data in here \(feed_data.value)")
        
        if feed_data.value.count > 0 {
            cell.contentText?.text = feed_data.value[indexPath.row].name
            cell.valueText.text = feed_data.value[indexPath.row].body
          
        }
        return cell
    }
}
