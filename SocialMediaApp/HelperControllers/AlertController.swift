//
//  AlertController.swift
//  SocialMediaApp
//
//  Created by Karthika on 8/2/21.
//

import Foundation
import UIKit

/*
 
 AlertController is the class that helps with displaying alert in any view controller
 
  */
class AlertController:UIViewController {
    /*
     showAlert is the function that contains the code for showing alert controller.
     Parameters taken - view : UIViewController and msg : String where view is the controller where alert to be displayed and msg is the message to be shown within the alert.
     Action - one action or button called Ok which when clicked dismiss the alert view
     Alert frame is designed to be on the middle of the screen approximately
     
     */
    public func showAlert(view:UIViewController,msg:String) {
        let alert = UIAlertController(title: "Alert", message: msg, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alert.addAction(okAction)
        alert.view.frame = CGRect(x:view.view.frame.minX+100, y: view.view.frame.midY-300, width: 500, height: 500)
        view.present(alert, animated: false, completion: nil)
    }
}
