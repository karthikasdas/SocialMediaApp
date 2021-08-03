//
//  FeedListViewController.swift
//  SocialMediaApp
//
//  Created by Karthika on 8/2/21.
//

import Foundation
import UIKit

class HeaderTapGestureRecognizer: UITapGestureRecognizer {
    var userSelected: String?
}

class FeedListViewController:UIViewController {
    
    @IBOutlet weak var tableView : UITableView!
    var feedDataSource = FeedListDataSource()
    var page = "1"
    let spinner = SpinnerController()
    lazy var feedViewModel : FeedListViewModel = {
        let viewModel = FeedListViewModel(dataSource: feedDataSource)
        return viewModel
    }()
    var user_id:String!
    override func viewDidLoad() {
        addChild(spinner)
        spinner.view.frame = self.view.frame
        self.view.addSubview(spinner.view)
        spinner.didMove(toParent: self)
        let nib = UINib(nibName: "FeedListCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: feedListCellIdentifier)
        let headerNib = UINib.init(nibName: "FeedListTableHeader", bundle: nil)
        self.tableView.register(headerNib, forHeaderFooterViewReuseIdentifier: "FeedListTableHeader")
        self.tableView.dataSource = feedDataSource
        self.tableView.delegate = self
        self.feedDataSource.feed_data.addAndNotify(observer: self) { [weak self] _ in
            print("In add and notify")
            self?.tableView.reloadData()
        }
        self.tableView.isUserInteractionEnabled = true
        self.feedViewModel.fetchFeedList(of: page, spinner: spinner, view: self)
    }
}

extension FeedListViewController:UITableViewDelegate,UIGestureRecognizerDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "FeedListTableHeader") as! FeedListTableHeader
        headerView.fetchUser(of: self.feedDataSource.feed_data.value[section].userID)
        let tapGesture = HeaderTapGestureRecognizer(target: self, action: #selector(selectHeader(sender:)))
        tapGesture.userSelected = String(self.feedDataSource.feed_data.value[section].userID)
        tapGesture.delegate = self
        tapGesture.numberOfTapsRequired = 1
        tapGesture.numberOfTouchesRequired = 1
        headerView.addGestureRecognizer(tapGesture)
        return headerView
    }
     
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 70
    }

    @objc func selectHeader(sender: HeaderTapGestureRecognizer) {
        self.user_id = sender.userSelected
        self.performSegue(withIdentifier: "clickHeader", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let controller = segue.destination as? ProfileViewController {
            controller.user_id = self.user_id
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "CommentViewController") as! CommentViewController
            self.present(vc, animated: true, completion: nil)
    }
}
