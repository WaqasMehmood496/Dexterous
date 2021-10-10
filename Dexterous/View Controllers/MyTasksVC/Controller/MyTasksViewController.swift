//
//  MyTasksViewController.swift
//  Dexterous
//
//  Created by Macbook Air on 9/14/21.
//

import UIKit

class MyTasksViewController: UIViewController {
    
    //IBOUTLET'S
    @IBOutlet weak var addTaskTableview: UITableView!
    @IBOutlet weak var compTableView: UITableView!
    
    //VARIABLE'S
    var isHideSection = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addTaskTableview.tag = 1
        compTableView.tag = 2
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
        self.tabBarController?.tabBar.isHidden = false
        self.freeTrailPopUp()
    }
    
    //IBACTION'S
    @IBAction func popOpenbtn(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "popviewViewController") as! popviewViewController
        controller.taskDelegate = self
        controller.array = ["Add Task","New Project","Templates","Cancel"]
        controller.isredirectFrom = "TASK"
        controller.popUpFrom = .task
        self.parent?.tabBarController?.present(controller, animated: true, completion: nil)
    }
    
    @objc func newTask(){
        self.MoveToNextVC(identifier: "AddTaskViewController")
    }
}


//MARK:- HELPING METHODS
extension MyTasksViewController {
    func MoveToNextVC(identifier:String)  {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(identifier: identifier)
        self.navigationController?.pushViewController(controller, animated: true)
    }
}



//MARK:- Delegate Methods
extension MyTasksViewController {
    func moveToAddTask() {
        self.MoveToNextVC(identifier: "AddTaskViewController")
    }
    func moveToCreateProjectTask() {
        self.MoveToNextVC(identifier: "StartAProjectController")
    }
    func moveToTemplates() {
        self.MoveToNextVC(identifier: "AllTemplatesController")
    }
}


//MARK:- UITABLEVUEW DELEGATE AND DATASOURCE METHOD'S
extension MyTasksViewController: UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if tableView.tag == 1 {
            return 1
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        if tableView.tag == 1 {
            let projectSection = Bundle.main.loadNibNamed("SeeAllHeader", owner: self, options: nil)?.first as! SeeAllSectionHeader
            projectSection.SectionTitle.text = "Project1"
            projectSection.HeaderBtn.addTarget(self,
                                               action: #selector(self.hideSection(sender:)),
                                               for: .touchUpInside)
            return projectSection
            
        } else {
            return UIView()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if tableView.tag == 1 {
            return 25.0
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView.tag == 1{
            return isHideSection ? 0 : 4
        } else {
            return 3
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView.tag == 1 {
            if indexPath.row ==  3 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "MyTask2TableViewCell") as! MyTask2TableViewCell
                cell.addbtn.addTarget(self, action: #selector(newTask), for: .touchUpInside)
                clearCellSelectionColor(cell: cell)
                return cell
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "DashboardMyTaskCell") as! DashboardMyTaskCell
                clearCellSelectionColor(cell: cell)
                return cell
            }
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MyTask3TableViewCell") as! MyTask3TableViewCell
            clearCellSelectionColor(cell: cell)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        MoveToNextVC(identifier: "AllProjectsController")
    }
    
    func clearCellSelectionColor(cell:UITableViewCell) {
        let view = UIView()
        view.backgroundColor = .clear
        cell.selectedBackgroundView = view
    }
    
    @objc
    private func hideSection(sender: UIButton) {
        self.isHideSection = !isHideSection
        self.addTaskTableview.reloadSections(IndexSet(integer: sender.tag), with: .fade)
    }
    
}
