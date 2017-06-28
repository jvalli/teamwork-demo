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
    
    @IBOutlet weak var tableViewTasks: UITableView!
    @IBOutlet weak var viewNoTasks: UIView!
    
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
        
        displayLoadingSpinner()
        tasksController.getTaskList(handler: { tasks, error in
            
            if tasks != nil, tasks!.count > 0 {
                self.viewNoTasks.isHidden = true
                self.view.bringSubview(toFront: self.tableViewTasks)
            } else {
                self.viewNoTasks.isHidden = false
                self.view.bringSubview(toFront: self.viewNoTasks)
                if error != nil {
                    TWAlertView.displayErrorAlert(message: error!.localizedDescription, sender: self)
                }
            }
            self.tableViewTasks.reloadData()
            self.hideLoadingSpinner()
        })
    }
    
    // MARK: - # Public functions
    
    public func loadTasksController(with project: TWProject) {
        tasksController.setProject(aProject: project)
    }
}

extension TWTasksVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasksController.getProjectTasks().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewTasks.dequeueReusableCell(withIdentifier: TWConstants.UI.CellIdentifiers.taskCell, for: indexPath)// as! UITableViewCell
        
        let task = tasksController.getProjectTasks()[indexPath.row]
        cell.textLabel?.text = task.taskContent
        
        return cell
    }
}

extension TWTasksVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //let task = tasksController.getProjectTasks()[indexPath.row]
        //projectsController.setSelectedProject(project: project)
        //performSegue(withIdentifier: TWConstants.Segues.goToTasksScreen, sender: self)
        tableViewTasks.deselectRow(at: indexPath, animated: true)
    }
}
