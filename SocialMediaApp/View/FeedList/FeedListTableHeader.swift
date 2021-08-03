//
//  FeedListTableHeader.swift
//  SocialMediaApp
//
//  Created by Karthika on 8/3/21.
//

import UIKit

class FeedListTableHeader: UITableViewHeaderFooterView {
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var profileName: UILabel!
    var profileData: User! {
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
    }
    public func fetchUser(of id:Int){
        print("Fecth user \(id)")
        self.profileViewModel.fetchProfileList(of: String(id))
    }
}
