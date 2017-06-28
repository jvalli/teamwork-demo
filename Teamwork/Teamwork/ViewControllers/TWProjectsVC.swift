//
//  TWProjectsVC.swift
//  Teamwork
//
//  Created by Jerónimo Valli on 6/20/17.
//  Copyright © 2017 Teamwork. All rights reserved.
//

import UIKit

class TWProjectsVC: TWBaseVC {

    // MARK: - # Variables
    
    @IBOutlet weak var tableViewProjects: UITableView!
    @IBOutlet weak var viewNoProjects: UIView!
    
    var projectsController = TWProjectsController()
    
    // MARK: - # Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadViewData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == TWConstants.Segues.goToTasksScreen {
            if let tasksVC = segue.destination as? TWTasksVC, let project = projectsController.getSelectedProject() {
                tasksVC.loadTasksController(with: project)
            }
        }
    }
    
    // MARK: - # Private functions
    
    fileprivate func loadViewData() {
        
        displayLoadingSpinner()
        projectsController.getProjectList(handler: { projects, error in
            
            if projects != nil, projects!.count > 0 {
                self.viewNoProjects.isHidden = true
                self.view.bringSubview(toFront: self.tableViewProjects)
            } else {
                self.viewNoProjects.isHidden = false
                self.view.bringSubview(toFront: self.viewNoProjects)
                if error != nil {
                    TWAlertView.displayErrorAlert(message: error!.localizedDescription, sender: self)
                }
            }
            self.tableViewProjects.reloadData()
            self.hideLoadingSpinner()
        })
    }
}

extension TWProjectsVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return projectsController.getAllProjects().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewProjects.dequeueReusableCell(withIdentifier: TWConstants.UI.CellIdentifiers.projectCell, for: indexPath) as! TWProjectCell
        
        let project = projectsController.getAllProjects()[indexPath.row]
        cell.loadCell(with: project)
        
        return cell
    }
}

extension TWProjectsVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let project = projectsController.getAllProjects()[indexPath.row]
        projectsController.setSelectedProject(project: project)
        performSegue(withIdentifier: TWConstants.Segues.goToTasksScreen, sender: self)
        tableViewProjects.deselectRow(at: indexPath, animated: true)
    }
}
