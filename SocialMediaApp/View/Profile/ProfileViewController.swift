//
//  ProfileViewController.swift
//  SocialMediaApp
//
//  Created by Karthika on 8/3/21.
//

import Foundation
import UIKit


/*
 
 class that shows profile data
 Data shown in a table
 Table datasource is ProfileDataSource
 profileViewModel is used for api call
 Observer has been used to get notified when the feed data of the data source is changed and to reload the table view
 */
class ProfileViewController:UIViewController {
    
    @IBOutlet weak var profileTableView : UITableView!
    var profileDataSource = ProfileDataSource()
    lazy var profileViewModel : ProfileViewModel = {
        let viewModel = ProfileViewModel(dataSource: profileDataSource)
        return viewModel
    }()
    var user:User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "User Profile"
        let nib = UINib(nibName: "ProfileCell", bundle: nil)
        self.profileTableView.register(nib, forCellReuseIdentifier: profileCellIdentifier)
        self.profileTableView.dataSource = profileDataSource
        if let userData = self.user {
            self.profileDataSource.feed_data.value = [userData]
        }
        else{
            self.profileDataSource.feed_data.addAndNotify(observer: self) { [weak self] _ in
                print("profileDataSource changed table")
                self?.profileTableView.reloadData()
            }
            guard self.profileDataSource.feed_data.value.count == 0 else {
                print("Reloading table")
                self.profileTableView.reloadData()
                return
            }
            self.profileViewModel.fetchProfileList(of: String(user.id))
        }
    }
}
