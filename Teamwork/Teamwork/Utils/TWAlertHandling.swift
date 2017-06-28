//
//  TWAlertView.swift
//  Teamwork
//
//  Created by Jerónimo Valli on 6/28/17.
//  Copyright © 2017 Teamwork. All rights reserved.
//

import UIKit

class TWAlertView: NSObject {
    
    static func displaySingleAlert(title: String, message: String, sender: AnyObject) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: String(format: NSLocalizedString("ok", comment: "")), style: .default, handler: nil))
        
        if let viewController = sender as? UIViewController {
            viewController.present(alertController, animated: true, completion: nil)
        }
    }
    
    static func displayErrorAlert(message: String, sender: AnyObject) {
        TWAlertView.displaySingleAlert(title: String(format: NSLocalizedString("error", comment: "")), message: message, sender: sender)
    }
}
