//
//  TWBaseVC.swift
//  Teamwork
//
//  Created by Jerónimo Valli on 6/28/17.
//  Copyright © 2017 Teamwork. All rights reserved.
//

import UIKit

class TWBaseVC: UIViewController {
    
    // MARK: - # Variables
    
    var viewLoading: UIView = {
        let aView = UIView(frame: UIScreen.main.bounds)
        aView.backgroundColor = TWConstants.Colors.transparentGray
        let activity = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.whiteLarge)
        activity.frame = CGRect(x: (UIScreen.main.bounds.size.width/2)-(activity.bounds.width/2), y: (UIScreen.main.bounds.size.height/2)-(activity.bounds.height/2), width: activity.bounds.width, height: activity.bounds.height)
        activity.startAnimating()
        aView.addSubview(activity)
        return aView
    }()
    
    // MARK: - Public functions
    
    public func displayLoadingSpinner() {
        view.addSubview(viewLoading)
    }
    
    public func hideLoadingSpinner() {
        viewLoading.removeFromSuperview()
    }
}
