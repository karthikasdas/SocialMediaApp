//
//  CommentViewController.swift
//  SocialMediaApp
//
//  Created by Karthika on 8/3/21.
//

import Foundation
import UIKit

class CommentViewController:UIViewController {
    @IBOutlet weak var commentTableView : UITableView!
    var commentDataSource = CommentDataSource()
    lazy var commentViewModel : CommentViewModel = {
        let viewModel = CommentViewModel(dataSource: commentDataSource)
        return viewModel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "ProfileCell", bundle: nil)
        self.commentTableView.register(nib, forCellReuseIdentifier: profileCellIdentifier)
        self.commentTableView.dataSource = commentDataSource
        self.commentDataSource.feed_data.addAndNotify(observer: self) { [weak self] _ in
            self?.commentTableView.reloadData()
        }
        
        self.commentViewModel.fetchCommentList()
    }
}
