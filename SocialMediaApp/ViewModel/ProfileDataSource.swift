//
//  ProfileDataSource.swift
//  SocialMediaApp
//
//  Created by Karthika on 8/3/21.
//

import Foundation

import UIKit

class ProfileDataSource : GenericDataSource<User>, UITableViewDataSource {
    
    var textData = ["Name","Email","Gender","Status"]
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: profileCellIdentifier, for: indexPath) as! ProfileCell
        cell.contentText?.text = textData[indexPath.row]
        print("Data in here \(feed_data.value)")
        
        if feed_data.value.count > 0 {
            switch indexPath.row {
            case 0:
                cell.valueText.text = feed_data.value[0].name
            case 1:
                cell.valueText.text = feed_data.value[0].email
            case 2:
                cell.valueText.text = feed_data.value[0].gender
            case 3:
                cell.valueText.text = feed_data.value[0].status
            default:
                cell.valueText.text = "Error"
            }
        }
        return cell
    }
}
