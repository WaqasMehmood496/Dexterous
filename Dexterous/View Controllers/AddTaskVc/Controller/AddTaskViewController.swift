//
//  AddTaskViewController.swift
//  Dexterous
//
//  Created by Macbook Air on 9/14/21.
//

import UIKit
import RSSelectionMenu

class AddTaskViewController: UIViewController {

    
    //VARIBALE'S
    let simpleDataArray = ["Website", "Video", "Web"]
    var selectedDropDownValues = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = true
        self.freeTrailPopUp()
    }
    
    //IBACTION'S
    @IBAction func cancelbtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func donebtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)

    }
    @IBAction func tierBtn(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "TiervViewController") as! TiervViewController
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    @IBAction func CalanderBtnAction(_ sender: Any) {
        MoveToNextVC(identifier: "MediaCalenderViewController")
    }
    
    @IBAction func AssignToTeamBtnAction(_ sender: UIButton) {
        showAssignToTeamDropDown(sender: sender)
    }
    
}



//MARK:- HELPING METHODS
extension AddTaskViewController {
    func MoveToNextVC(identifier:String)  {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(identifier: identifier)
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    func showAssignToTeamDropDown(sender:UIButton) {
        
        let selectionMenu = RSSelectionMenu(dataSource: simpleDataArray) { (cell, item, indexPath) in
            cell.textLabel?.text = item
        }
        
        selectionMenu.setSelectedItems(items: selectedDropDownValues) { [weak self] (item, index, isSelected, selectedItems) in
            print(selectedItems)
        }
        
        selectionMenu.tableView?.showsVerticalScrollIndicator = false
        selectionMenu.tableView?.separatorStyle = .none
        selectionMenu.tableView?.borderColor = .clear
        
        selectionMenu.show(style: .popover(sourceView: sender, size: CGSize(width: 100, height: 100)), from: self)
    }
}
