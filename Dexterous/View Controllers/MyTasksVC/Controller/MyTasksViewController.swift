//
//  MyTasksViewController.swift
//  Dexterous
//
//  Created by Macbook Air on 9/14/21.
//

import UIKit

class MyTasksViewController: UIViewController {
    
    @IBOutlet weak var addTaskTableview: UITableView!
    
    @IBOutlet weak var compTableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addTaskTableview.tag = 1
        compTableView.tag = 2
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
        self.tabBarController?.tabBar.isHidden = false
    }
    
    @objc func newTask(){
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "AddTaskViewController") as! AddTaskViewController
        self.navigationController?.pushViewController(controller, animated: true)
       // self.present(controller, animated: true, completion: nil)
        
        
        
    }
    @IBAction func popOpenbtn(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "popviewViewController") as! popviewViewController
        controller.delegate = self
        controller.array = ["Add Task","New Project","Share","Cancel"]
        controller.isredirectFrom = "TASK"
        self.parent?.tabBarController?.present(controller, animated: true, completion: nil)
    }
    
}
extension MyTasksViewController: UITableViewDelegate,UITableViewDataSource{
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if tableView.tag == 1 {
            return 1

        }
        else{
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
            headerView.addSubview(label)
            return headerView
            
        }
        else{
            
            return UIView()
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if tableView.tag ==  1{
            return 25.0
            
        }
        else{
            return 0
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView.tag == 1{
            return 4
            
        }
        else{
            
            return 3
            
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView.tag == 1{
            
            if indexPath.row ==  3{
                let cell = tableView.dequeueReusableCell(withIdentifier: "MyTask2TableViewCell") as! MyTask2TableViewCell
                
                cell.addbtn.addTarget(self, action: #selector(newTask), for: .touchUpInside)
                
                return cell
            }
            else{
                let cell = tableView.dequeueReusableCell(withIdentifier: "MyTask1TableViewCell") as! MyTask1TableViewCell
                
                
                return cell
            }
        }
        
        else{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "MyTask3TableViewCell") as! MyTask3TableViewCell
            
            
            return cell
        }
        
        
        
    }
    
}
