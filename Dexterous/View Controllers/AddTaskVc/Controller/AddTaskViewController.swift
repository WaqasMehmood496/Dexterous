//
//  AddTaskViewController.swift
//  Dexterous
//
//  Created by Macbook Air on 9/14/21.
//

import UIKit
import iOSDropDown
import IQKeyboardManagerSwift

class AddTaskViewController: UIViewController {
    
    //IBOUTLET'S
    @IBOutlet weak var TaskNameTF: UITextField!
    @IBOutlet weak var AssignedByTF: DropDown!
    @IBOutlet weak var DueDateTF: UITextField!
    @IBOutlet weak var DetailTV: UITextView!
    @IBOutlet weak var CheckMarkBtn: UIButton!
    @IBOutlet weak var ComponyLogo: UIImageView!
    
    //CONSTANT'S
    let simpleDataArray = ["Website", "Video", "Web"]
    //VARIBALE'S
    var selectedDropDownValues = [String]()
    var isNameAssigned = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showAssignToTeamDropDown()
        DetailTV.delegate = self
        addComponyLogoTapGesture()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = true
        self.freeTrailPopUp()
        TaskNameTF.delegate = self
    }
    
    //IBACTION'S
    @IBAction func cancelbtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func donebtn(_ sender: Any) {
        if isNameAssigned == true {
            self.navigationController?.popViewController(animated: true)
        } else {
            PopupHelper.showAlertControllerWithError(forErrorMessage: "Please give a task name and assign atleast one person or team to create.", forViewController: self)
        }
    }
    
    @IBAction func tierBtn(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "TiervViewController") as! TiervViewController
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    @IBAction func CalanderBtnAction(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let searchUserController = storyboard.instantiateViewController(withIdentifier: "DateSelectionController") as! DateSelectionController

        self.present(searchUserController, animated: true, completion: nil)
    }
}

//MARK:- HELPING METHODS
extension AddTaskViewController {
    
    func addComponyLogoTapGesture() {
        let logoTapGesture = UITapGestureRecognizer(target: self, action: #selector(ComponyLogoTapGesture(_:)))
        self.ComponyLogo.addGestureRecognizer(logoTapGesture)
        
    }
    
    @objc func ComponyLogoTapGesture(_ sender: UITapGestureRecognizer) {
        let logoController = getViewController(identifier: "ComponyLogosController") as! ComponyLogosController
        self.parent?.tabBarController?.present(logoController, animated: false, completion: nil)
    }
    
    func MoveToNextVC(identifier:String)  {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(identifier: identifier)
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    
    func showAssignToTeamDropDown() {
        
        //        let selectionMenu = RSSelectionMenu(dataSource: simpleDataArray) { (cell, item, indexPath) in
        //            cell.textLabel?.text = item
        //        }
        //
        //        selectionMenu.setSelectedItems(items: selectedDropDownValues) { [weak self] (item, index, isSelected, selectedItems) in
        //            print(selectedItems)
        //        }
        //
        //        selectionMenu.tableView?.showsVerticalScrollIndicator = false
        //        selectionMenu.tableView?.separatorStyle = .none
        //        selectionMenu.tableView?.borderColor = .clear
        //
        //        selectionMenu.show(style: .popover(sourceView: sender, size: CGSize(width: 100, height: 100)), from: self)
        
        AssignedByTF.optionArray = [
            "Team 1",
            "Team 2",
            "Team 3",
            "Team 4"
        ]
        AssignedByTF.checkMarkEnabled = false
        AssignedByTF.selectedIndex = 0
        AssignedByTF.text = ""
        AssignedByTF.didSelect { (selectedText, index, id) in
        }
    }
}

extension AddTaskViewController: UITextViewDelegate {
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor(named: "Gray") {
            textView.text = ""
            textView.textColor = UIColor(named: "Button Black Bacground")
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "Detail"
            textView.textColor = UIColor(named: "Gray")
        }
    }
}

extension AddTaskViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        IQKeyboardManager.shared.enableAutoToolbar = true
        if textField.text == "" {
            isNameAssigned = true
        }
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.text == "" {
            isNameAssigned = false
        } else {
            isNameAssigned = true
        }
        
        if self.isNameAssigned == true {
            self.CheckMarkBtn.tintColor = UIColor(named: "Green")
        }
        IQKeyboardManager.shared.enableAutoToolbar = false
    }
}
