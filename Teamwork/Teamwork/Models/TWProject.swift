//
//  TWProject.swift
//  Teamwork
//
//  Created by Jerónimo Valli on 6/28/17.
//  Copyright © 2017 Teamwork. All rights reserved.
//

import Foundation

class TWProject: NSObject {
    
    // MARK: - # Variables
    
    var projectId: String?
    var projectName: String?
    var projectDescription: String?
    var projectLogo: String?
    
    // MARK: - # Life Cycle
    
    override init() {
        super.init()
    }
    
    convenience init(projectDictionary: [String: Any]) {
        self.init()
        
        if let id = projectDictionary[TWConstants.API.Keys.id] as? String {
            projectId = id
        }
        if let name = projectDictionary[TWConstants.API.Keys.name] as? String {
            projectName = name
        }
        if let description = projectDictionary[TWConstants.API.Keys.description] as? String {
            projectDescription = description
        }
        if let logo = projectDictionary[TWConstants.API.Keys.logo] as? String {
            projectLogo = logo
        }
    }
}
