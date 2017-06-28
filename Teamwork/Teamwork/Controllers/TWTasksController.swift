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
    fileprivate var projectTasks = [TWTask]()
    
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
    
    public func getTaskList(handler: ((_ tasks: [TWTask]?, _ error: Error?) -> Void)?) {
        
        guard project != nil else {
            return
        }
        
        TWBaseAPI.shared.GET(endpoint: String(format: TWConstants.API.Endpoints.projectTasks, project!.projectId!), parameters: nil, handler: { response, error in
            
            if error != nil {
                print("error: \(error!.localizedDescription)")
            } else if let tasks = (response as? [String: Any])?[TWConstants.API.Keys.todoItems] as? [[String: Any]] {
                self.projectTasks.removeAll()
                for task in tasks {
                    let newTask = TWTask(taskDictionary: task)
                    self.projectTasks.append(newTask)
                }
            }
            handler?(self.projectTasks, error)
        })
    }
    
    public func getProjectTasks() -> [TWTask] {
        return projectTasks
    }
}
