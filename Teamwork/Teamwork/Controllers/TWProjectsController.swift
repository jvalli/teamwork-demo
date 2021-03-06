//
//  TWProjectsController.swift
//  Teamwork
//
//  Created by Jerónimo Valli on 6/28/17.
//  Copyright © 2017 Teamwork. All rights reserved.
//

import Foundation

class TWProjectsController: NSObject {
    
    // MARK: - # Variables
    
    fileprivate var allProjects = [TWProject]()
    fileprivate var selectedProject: TWProject? = nil
    
    // MARK: - # Life Cycle
    
    override init() {
        super.init()
    }
    
    // MARK: - # Public functions
    
    public func getProjectList(handler: ((_ projects: [TWProject]?, _ error: Error?) -> Void)?) {
        
        TWBaseAPI.shared.GET(endpoint: TWConstants.API.Endpoints.projects, parameters: nil, handler: { response, error in
            
            if error != nil {
                print("error: \(error!.localizedDescription)")
            } else if let projects = (response as? [String: Any])?[TWConstants.API.Keys.projects] as? [[String: Any]] {
                self.allProjects.removeAll()
                for project in projects {
                    let newProject = TWProject(projectDictionary: project)
                    self.allProjects.append(newProject)
                }
            }
            handler?(self.allProjects, error)
        })
    }
    
    public func getAllProjects() -> [TWProject] {
        return allProjects
    }
    
    public func setSelectedProject(project: TWProject) {
        selectedProject = project
    }
    
    public func getSelectedProject() -> TWProject? {
        return selectedProject
    }
}
