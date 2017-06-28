//
//  TWTasksVC.swift
//  Teamwork
//
//  Created by Jerónimo Valli on 6/28/17.
//  Copyright © 2017 Teamwork. All rights reserved.
//

import UIKit

class TWTasksVC: TWBaseVC {
    
    // MARK: - # Variables
    
    var tasksController = TWTasksController()
    
    // MARK: - # Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadViewData()
    }
    
    // MARK: - # Private functions
    
    fileprivate func loadViewData() {
        
        if let projectName = tasksController.getProject()?.projectName {
            title = String(format: "%@ Tasks", projectName)
        }
        
        //TODO: download and list tasks
    }
    
    // MARK: - # Public functions
    
    public func loadTasksController(with project: TWProject) {
        tasksController.setProject(aProject: project)
    }
}
