//
//  TWLoginVC.swift
//  Teamwork
//
//  Created by Jerónimo Valli on 6/20/17.
//  Copyright © 2017 Teamwork. All rights reserved.
//

import UIKit

class TWLoginVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        TWBaseAPI.shared.GET(endpoint: TWConstants.API.Endpoints.projects, parameters: nil, handler: { response, error in
            
        })
    }
}
