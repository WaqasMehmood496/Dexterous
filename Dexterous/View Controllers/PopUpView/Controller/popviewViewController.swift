//
//  popviewViewController.swift
//  Dexterous
//
//  Created by Macbook Air on 9/14/21.

import UIKit

class popviewViewController: UIViewController {
    
    //IBOUTLET'S
    @IBOutlet weak var tableviewHeight: NSLayoutConstraint!
    @IBOutlet weak var poptableview: UITableView!
    
    //VARIABLE'S
    var taskDelegate = MyTasksViewController()
    var delegate2 = MessageViewController()
    var dashBoardDelegate = DashboardController()
    var messageControllerDelegate = MessageViewController()
    
    var isredirectFrom = ""
    var array = [String]()
    var popUpFrom:PopupType = .home
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.poptableview.delegate = self
        self.poptableview.dataSource = self
    }
    
    override func viewWillLayoutSubviews() {
        super.updateViewConstraints()
        self.tableviewHeight.constant = self.poptableview.contentSize.height
    }
    
    @IBAction func DismisTapGesture(_ sender: UITapGestureRecognizer) {
        dismiss(animated: true, completion: nil)
    }
}


//MARK:- UITABLEVUEW DELEGATE AND DATASOURCE METHOD'S
extension popviewViewController:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if array[indexPath.row] == "Cancel" {
            let cell = tableView.dequeueReusableCell(withIdentifier: "popCancelbtnTableViewCell") as! popCancelbtnTableViewCell
            cell.lblcancle.text = array[indexPath.row]
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "popOptionTableViewCell") as! popOptionTableViewCell
            cell.lbloption.text = array[indexPath.row]
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        self.viewWillLayoutSubviews()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath)
        tableView.deselectRow(at: indexPath, animated: true)
        
        switch popUpFrom {
        case .home:
            if indexPath.row == 1 {
                self.dismiss(animated: true) {
                    self.dashBoardDelegate.moveToAddTask()
                }
            } else if indexPath.row == 3 {
                self.dismiss(animated: true) {
                    self.dashBoardDelegate.moveToCreateProject()
                }
            }
        case .task:
            if indexPath.row == 0 {
                self.dismiss(animated: true) {
                    self.taskDelegate.moveToAddTask()
                }
            } else if indexPath.row == 1 {
                self.dismiss(animated: true) {
                    self.taskDelegate.moveToCreateProjectTask()
                }
            }
        case .message:
            if indexPath.row == 0 {
                self.dismiss(animated: true) {
                    self.messageControllerDelegate.moveToEditTeam()
                }
            }
        }
        
        switch array[indexPath.row] {
        case "Cancel":
            self.dismiss(animated: false) {
            }
        default:
            return
        }
    }
}
