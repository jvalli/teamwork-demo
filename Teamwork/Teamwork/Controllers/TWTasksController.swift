//
//  TWTasksController.swift
//  Teamwork
//
//  Created by Jerónimo Valli on 6/28/17.
//  Copyright © 2017 Teamwork. All rights reserved.
//

import Foundation

class TWTasksController: NSObject {
    
    // MARK: - # Variables
    
    fileprivate var project: TWProject? = nil
    
    // MARK: - # Life Cycle
    
    override init() {
        super.init()
    }
    
    convenience init(aProject: TWProject) {
        self.init()
        
        project = aProject
    }
    
    // MARK: - # Public functions
    
    public func setProject(aProject: TWProject) {
        project = aProject
    }
    
    public func getProject() -> TWProject? {
        return project
    }
}
