//
//  TiervViewController.swift
//  Dexterous
//
//  Created by Macbook Air on 9/14/21.
//

import UIKit

class TiervViewController: UIViewController {
    
    //IBOUTLET'S
    @IBOutlet weak var tierTableView: UITableView!
    
    //VARIABLE'S
    var tierTaskArray = [
        TierTaskModel(
            taskNumber: "First Task", taskName: "Website Design", assigTo: ["Ellipse 1","Ellipse 1","Ellipse 1"], duaDate: "12/01/2021"
        )
    ]
    var AssignMemberArray = [String]()
    var isAssignLaterSelected = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.freeTrailPopUp()
    }
    
    //IBACTION'S
    @IBAction func tempBtn(_ sender: Any) {
        //self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func cancelbtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func donebtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}

//MARK: - HELPING METHOD'S
extension TiervViewController {
    func MoveToNextVC(identifier:String)  {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(identifier: identifier)
        self.navigationController?.pushViewController(controller, animated: false)
    }
}



//MARK: - UITABLEVIEW DELEGATE AND DATASOURCE METHOD'S
extension TiervViewController:UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 1 {
            return self.tierTaskArray.count
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
            //START
            let cell = tableView.dequeueReusableCell(withIdentifier: "StartupTierCell") as! StartupTierCell
            clearCellSelectionColor(cell: cell)
            return cell
        case 1:
            // ALL TASKS
            let cell = tableView.dequeueReusableCell(withIdentifier: "AllTaskTierCell") as! AllTaskTierCell
            cell.TaskNumber.text = self.tierTaskArray[indexPath.row].taskNumber
            cell.TaskTitle.text = self.tierTaskArray[indexPath.row].taskName
            cell.TaskMembers.delegate = self
            cell.TaskMembers.dataSource = self
            cell.TaskMembers.tag = 50
            cell.DueDate.text = self.tierTaskArray[indexPath.row].duaDate
            
            clearCellSelectionColor(cell: cell)
            return cell
        case 2:
            // NEW TASK
            let cell = tableView.dequeueReusableCell(withIdentifier: "NewTierTaskCell") as! NewTierTaskCell
            cell.MembersCollection.delegate = self
            cell.MembersCollection.dataSource = self
            cell.MembersCollection.tag = 100
            if self.AssignMemberArray.isEmpty {
                cell.MembersCollectionHeightConstraint.constant = 0.0
            } else {
                cell.MembersCollectionHeightConstraint.constant = 32.5
            }
            cell.AssignLaterBtn.addTarget(self, action: #selector(assignLaterBtnAction(_:)), for: .touchUpInside)
            cell.AssignSomeoneBtn.addTarget(self, action: #selector(assignSomeOneBtnAction(_:)), for: .touchUpInside)
            cell.CalanderBtn.addTarget(self, action: #selector(dueDateCalanderBtnAction(_:)), for: .touchUpInside)
            clearCellSelectionColor(cell: cell)
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "StartupTierCell") as! StartupTierCell
            clearCellSelectionColor(cell: cell)
            return cell
        }
    }
    
    func clearCellSelectionColor(cell:UITableViewCell) {
        let view = UIView()
        view.backgroundColor = .clear
        cell.selectedBackgroundView = view
    }
    
    @objc func assignLaterBtnAction (_ sender: UIButton) {
        
        if isAssignLaterSelected {
            sender.setImage(UIImage(named: ""), for: .normal)
        } else{
            sender.setImage(UIImage(named: "Icon awesome-check"), for: .normal)
        }
        isAssignLaterSelected = !isAssignLaterSelected
    }
    
    @objc func assignSomeOneBtnAction (_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let searchUserController = storyboard.instantiateViewController(withIdentifier: "SearchUserController") as! SearchUserController
        self.present(searchUserController, animated: true, completion: nil)
    }
    
    @objc func dueDateCalanderBtnAction (_ sender: UIButton) {
        //MoveToNextVC(identifier: "")
    }
    
}

extension TiervViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView.tag == 50 {
            return self.tierTaskArray[section].assigTo.count
        } else {
            return self.AssignMemberArray.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView.tag == 50 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TierTaskMemberCell", for: indexPath) as! TierTaskMemberCell
            
            cell.TaskMemberImage.image = UIImage(named: self.tierTaskArray[indexPath.section].assigTo[indexPath.row])
            
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TierTaskMemberCell", for: indexPath) as! TierTaskMemberCell
            
            cell.TaskMemberImage.image = UIImage(named: AssignMemberArray[indexPath.row])
            
            return cell
        }
    }
    
}
