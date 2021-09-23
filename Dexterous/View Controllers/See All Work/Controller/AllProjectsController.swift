//
//  AllProjectsController.swift
//  Dexterous
//
//  Created by Buzzware Tech on 16/09/2021.
//

import UIKit

class AllProjectsController: UIViewController {
    
    //IBOUTLET'S
    @IBOutlet weak var ProjectsTableView: UITableView!
    
    //VARIABLES
    var isHideSection = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
}


//MARK:- UITABLEVIEW DATASOURCE AND DELEGATES METHOD'S
extension AllProjectsController:UITableViewDelegate,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let projectSection = Bundle.main.loadNibNamed("SeeAllHeader", owner: self, options: nil)?.first as! SeeAllSectionHeader
        projectSection.SectionTitle.text = "Project1"
        projectSection.HeaderBtn.addTarget(self,
                                           action: #selector(self.hideSection(sender:)),
                                           for: .touchUpInside)
        return projectSection
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 35
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isHideSection ? 0 : 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProjectTableViewCell", for: indexPath) as! ProjectTableViewCell
        return cell
    }
    
    @objc
    private func hideSection(sender: UIButton) {
        self.isHideSection = !isHideSection
        self.ProjectsTableView.reloadSections(IndexSet(integer: sender.tag), with: .fade)
    }
}


