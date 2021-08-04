//
//  FeedListCell.swift
//  SocialMediaApp
//
//  Created by Karthika on 8/2/21.
//

import Foundation
import UIKit

/*
 Responsible for showing the feed cell
 All Interface elements shown in feed table cell is listed
 When each cell is loaded the profile name changes which is downloaded from the backend
 */
class FeedListCell:UITableViewCell {
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var body: UILabel!
    @IBOutlet weak var profileView: UIView!
    @IBOutlet weak var profileName: UILabel!
    @IBOutlet weak var profileButton: UIButton!

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

    
    var cellData: ListOfFeed! {
        didSet {
            self.body.text = cellData.body
            self.title.text = cellData.title
            fetchUser(of: cellData.userID)
        }
    }
    var profileData:User! {
        didSet {
            self.profileName.text = profileData.name
        }
    }
    var profileDataSource = ProfileDataSource()
    
    lazy var profileViewModel : ProfileViewModel = {
        let viewModel = ProfileViewModel(dataSource: profileDataSource)
        return viewModel
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.profileDataSource.feed_data.addAndNotify(observer: self) { [weak self] _ in
            if let profile = self?.profileDataSource.feed_data.value {
                if(profile.count > 0) {
                    print("Profile \(profile) \(profile.count)")
                    self?.profileData = profile[0]
                }
            }
        }
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.tapProfile(sender:)))
        tap.delegate = self
        self.profileView.isUserInteractionEnabled = true
        self.profileView.addGestureRecognizer(tap)
    }
    
    public func fetchUser(of id:Int){
        self.profileViewModel.fetchProfileList(of: String(id))
    }
    
    @objc func tapProfile(sender:UITapGestureRecognizer){
        let userData:[String: User] = ["user": profileData]

          // post a notification
          NotificationCenter.default.post(name: NSNotification.Name(rawValue: "profileClicked"), object: nil, userInfo: userData)


    }
}
