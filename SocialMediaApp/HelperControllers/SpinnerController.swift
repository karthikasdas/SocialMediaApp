//
//  SpinnerController.swift
//  SocialMediaApp
//
//  Created by Karthika on 8/2/21.
//

import Foundation
import UIKit

/*
 
 SpinnerController is the class that helps with displaying activity indicator in any view controller
 
  */
class SpinnerController:UIViewController {
    /*
     loadView is the function that is overriden, since every controller has it, contains the code for showing activity indicator.
     Parameters taken - nil.
     activityIndicator is the constant that holds the activity indicator(spinner)
     View is designed and the spinner is added to its middle by setting constraints
     
     startAnimating() method starts its spinnning
     */
    
    let activityIndicator = UIActivityIndicatorView(style: .large)
    override func loadView() {
        view = UIView()
        view.backgroundColor = UIColor(white: 0, alpha: 0.7)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.startAnimating()
        view.addSubview(activityIndicator)
        activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}
