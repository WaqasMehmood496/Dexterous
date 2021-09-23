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
    var popUpFrom:PopupType = .home
    var isHideSection = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addTaskTableview.tag = 1
        compTableView.tag = 2
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
        self.tabBarController?.tabBar.isHidden = false
    }
    
    //IBACTION'S
    @IBAction func popOpenbtn(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "popviewViewController") as! popviewViewController
        controller.taskDelegate = self
        controller.array = ["Add Task","New Project","Share","Cancel"]
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
            let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 25))
            headerView.backgroundColor = UIColor.clear
            let label = UILabel()
            label.frame = CGRect.init(x: 24, y: 12,width: headerView.frame.width-20, height: headerView.frame.height-12)
            label.text = "Project1"
            label.font = UIFont(name: "System", size: 10)
            label.textColor = UIColor.black
            
            let sectionButton = UIButton(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 25))
            sectionButton.setTitle(String(" "),
                                   for: .normal)
            sectionButton.backgroundColor = .clear
            sectionButton.tag = section
            sectionButton.addTarget(self,
                                    action: #selector(self.hideSection(sender:)),
                                    for: .touchUpInside)
            headerView.addSubview(label)
            headerView.addSubview(sectionButton)
            return headerView
            
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
                return cell
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "MyTask1TableViewCell") as! MyTask1TableViewCell
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
