//
//  CommentViewController.swift
//  SocialMediaApp
//
//  Created by Karthika on 8/3/21.
//

import Foundation
import UIKit

/*
 
 class that shows comment list
 Commenst shown as table
 Table datasource is Comment data source
 commentViewModel is used for api call
 For easiness Profile Cell is used
 When the last row is reached in comments table loadcomments() function is notified to call more api.
 */
class CommentViewController:UIViewController {
    @IBOutlet weak var commentTableView : UITableView!
    var commentDataSource = CommentDataSource()
    lazy var commentViewModel : CommentViewModel = {
        let viewModel = CommentViewModel(dataSource: commentDataSource)
        return viewModel
    }()
    var page = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Comments"
        let nib = UINib(nibName: "ProfileCell", bundle: nil)
        self.commentTableView.register(nib, forCellReuseIdentifier: profileCellIdentifier)
        self.commentTableView.dataSource = commentDataSource
        self.commentDataSource.feed_data.addAndNotify(observer: self) { [weak self] _ in
            self?.commentTableView.reloadData()
        }
        
        loadComments()
        NotificationCenter.default.addObserver(self,selector: #selector(loadComments),name: NSNotification.Name(rawValue: commentNotificationKey),object: nil)
    }
    
    @objc func loadComments(){
        page += 1
        self.commentViewModel.fetchCommentList(of: String(page))
    }
}
