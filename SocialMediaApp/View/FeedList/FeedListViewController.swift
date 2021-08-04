//
//  FeedListViewController.swift
//  SocialMediaApp
//
//  Created by Karthika on 8/2/21.
//

import Foundation
import UIKit

//protocol ProfileClickDelegate:AnyObject {
//    func profileClicked(user:User)
//}

class FeedListViewController:UIViewController {
    
    @IBOutlet weak var tableView : UITableView!
    var feedDataSource = FeedListDataSource()
    var page = 0
    let spinner = SpinnerController()
    lazy var feedViewModel : FeedListViewModel = {
        let viewModel = FeedListViewModel(dataSource: feedDataSource)
        return viewModel
    }()
    var user:User!
    override func viewDidLoad() {
        addChild(spinner)
        spinner.view.frame = self.view.frame
        self.view.addSubview(spinner.view)
        spinner.didMove(toParent: self)
        let nib = UINib(nibName: "FeedListCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: feedListCellIdentifier)
        self.tableView.dataSource = feedDataSource
        self.tableView.delegate = self
        self.title = "Feed List"
        self.feedDataSource.feed_data.addAndNotify(observer: self) { [weak self] _ in
            self?.tableView.reloadData()
        }
        self.tableView.isUserInteractionEnabled = true
        callApi()
        NotificationCenter.default.addObserver(self,selector: #selector(callApi),name: NSNotification.Name(rawValue: notificationKey),object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.profileClicked(_:)), name: NSNotification.Name(rawValue: "profileClicked"), object: nil)

    }
    
    @objc func callApi() {
        page += 1
        self.feedViewModel.fetchFeedList(of: String(page), spinner: spinner, view: self)
    }
}

extension FeedListViewController:UITableViewDelegate  {

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if(segue.identifier == "profileClick"){
            let controller = segue.destination as? ProfileViewController
            controller?.user = self.user
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "commentSegue", sender: self)
    }
    
    @objc func profileClicked(_ notification: NSNotification) {
        print("Profie in FeedList")
        print(notification.userInfo ?? "")
               if let dict = notification.userInfo as NSDictionary? {
                   if let user = dict["user"] as? User{
                    self.user = user
                   }
               }
        self.performSegue(withIdentifier: "profileClick", sender: self)
    }
}

