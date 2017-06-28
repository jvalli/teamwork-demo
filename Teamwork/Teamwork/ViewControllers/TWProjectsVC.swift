//
//  TWProjectsVC.swift
//  Teamwork
//
//  Created by Jerónimo Valli on 6/20/17.
//  Copyright © 2017 Teamwork. All rights reserved.
//

import UIKit

class TWProjectsVC: UIViewController {

    @IBOutlet weak var tableViewProjects: UITableView!
    
    var projectsController = TWProjectsController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        projectsController.getProjectList(handler: { projects, error in
            
            self.tableViewProjects.reloadData()
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
    
}
