//
//  ProfileViewController.swift
//  SocialMediaApp
//
//  Created by Karthika on 8/3/21.
//

import Foundation
import UIKit

class ProfileViewController:UIViewController {
    
    @IBOutlet weak var profileTableView : UITableView!
    var profileDataSource = ProfileDataSource()
    lazy var profileViewModel : ProfileViewModel = {
        let viewModel = ProfileViewModel(dataSource: profileDataSource)
        return viewModel
    }()
    var user_id:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "ProfileCell", bundle: nil)
        self.profileTableView.register(nib, forCellReuseIdentifier: profileCellIdentifier)
        self.profileTableView.dataSource = profileDataSource
        self.profileDataSource.feed_data.addAndNotify(observer: self) { [weak self] _ in
            print("profileDataSource changed table")
            self?.profileTableView.reloadData()
        }
        guard self.profileDataSource.feed_data.value.count == 0 else {
            print("Reloading table")
            self.profileTableView.reloadData()
            return
        }
        self.profileViewModel.fetchProfileList(of: user_id)
    }
}
