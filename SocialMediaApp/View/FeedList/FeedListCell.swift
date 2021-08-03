//
//  FeedListCell.swift
//  SocialMediaApp
//
//  Created by Karthika on 8/2/21.
//

import Foundation
import UIKit

class FeedListCell:UITableViewCell {
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var body: UILabel!
    var cellData: ListOfFeed! {
        didSet {
            self.body.text = cellData.body
            self.title.text = cellData.title
        }
    }
    
}
