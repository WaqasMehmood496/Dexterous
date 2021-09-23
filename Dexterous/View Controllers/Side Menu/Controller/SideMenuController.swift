//
//  SideMenuController.swift
//  Dexterous
//
//  Created by Buzzware Tech on 14/09/2021.
//

import UIKit

class SideMenuController: UIViewController {
    
    //IBOUTLETS
    @IBOutlet weak var SideMenuTableView: UITableView!
    @IBOutlet weak var UserImage: UIImageView!
    
    //CONSTANTS
    
    //VARIABLES
    var sideMenuArray:[SideMenuModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.sideMenuArray = [
            SideMenuModel(data: [
                SideMenuOptionModel(image: "Group 2857", title: "Jane Brown", type: "Admin"),
                SideMenuOptionModel(image: "Group 2857", title: "Pick Clarke", type: "Billing"),
                SideMenuOptionModel(image: "Group 2857", title: "Samantha Stone", type: "Design")
            ], groupTitle: "Prople"),
            SideMenuModel(data: [
                SideMenuOptionModel(image: "Group 2860", title: "Push", type: ""),
                SideMenuOptionModel(image: "Group 2861", title: "Email", type: ""),
                SideMenuOptionModel(image: "Group 2862", title: "Text", type: "")
            ], groupTitle: "Notifications"),
            SideMenuModel(data: [
                SideMenuOptionModel(image: "Group 2865", title: "Privacy Policy", type: ""),
                SideMenuOptionModel(image: "Group 2864", title: "Terms of Services", type: ""),
                SideMenuOptionModel(image: "Group 2863", title: "Version 1.0", type: "")
            ], groupTitle: "Other")
        ]
        self.SideMenuTableView.reloadData()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func ShowProfile(_ sender: UIButton) {
        MoveToNextVC(identifier: "ProfileViewController")
    }
    @IBAction func EditProfileBtnAction(_ sender: Any) {
        MoveToNextVC(identifier: "EditProfileController")
    }
    
}

//MARK:- HELPING METHOD'S
extension SideMenuController {
    func setTapGestureOnUserImage() {
        let userImageGesture = UITapGestureRecognizer(target: self, action: #selector(userImageTapGesture(_:)))
        self.UserImage.addGestureRecognizer(userImageGesture)
    }
    
    @objc func userImageTapGesture(_ sender:UITapGestureRecognizer) {
        //Show Profile controller
    }
    
    func MoveToNextVC(identifier:String)  {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(identifier: identifier)
        self.navigationController?.pushViewController(controller, animated: true)
    }
}


extension SideMenuController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.sideMenuArray.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 40))
        
        let label = UILabel(frame: CGRect(x: 24, y: 0, width: tableView.frame.size.width - 48, height: 40))
        label.text = self.sideMenuArray[section].groupTitle
        label.textColor = UIColor.black
        label.font = UIFont(name: "Montserrat-Bold", size: 15)
        view.backgroundColor = UIColor(named: "Light Gray")
        view.addSubview(label)
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return sideMenuArray[section].data.count + 1
        } else if section == 1 {
            return sideMenuArray[section].data.count
        } else {
            return sideMenuArray[section].data.count + 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            // PEOPLE
            if indexPath.row >= sideMenuArray[indexPath.section].data.count {
                //INVITE TABLEVIEW CELL
                let cell = tableView.dequeueReusableCell(withIdentifier: "InviteConnectionsTableViewCell", for: indexPath) as! InviteConnectionsTableViewCell
                return cell
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "ConnectionsTableViewCell", for: indexPath) as! ConnectionsTableViewCell
                cell.ConnectionImage.image = UIImage(named: self.sideMenuArray[indexPath.section].data[indexPath.row].image)
                cell.NameLabel.text = self.sideMenuArray[indexPath.section].data[indexPath.row].title
                cell.OccupationLabel.text = self.sideMenuArray[indexPath.section].data[indexPath.row].type
                return cell
            }
            
        } else if indexPath.section == 1 {
            //NOTIFICATIONS
            let cell = tableView.dequeueReusableCell(withIdentifier: "ConnectionsTableViewCell", for: indexPath) as! ConnectionsTableViewCell
            cell.ConnectionImage.image = UIImage(named: self.sideMenuArray[indexPath.section].data[indexPath.row].image)
            cell.NameLabel.text = self.sideMenuArray[indexPath.section].data[indexPath.row].title
            cell.OccupationLabel.text = self.sideMenuArray[indexPath.section].data[indexPath.row].type
            
            cell.SelectionBtn.tag = indexPath.row
            cell.SelectionBtn.addTarget(self, action: #selector(notificationBtnAction(_:)), for: .touchUpInside)
            return cell
            
        } else {
            // OTHERS
            if indexPath.row >= sideMenuArray[indexPath.section].data.count {
                //INVITE TABLEVIEW CELL
                let cell = tableView.dequeueReusableCell(withIdentifier: "OtherTableViewCell", for: indexPath) as! OtherTableViewCell
                cell.AddMarketingBtn.tag = indexPath.row
                cell.AddMarketingBtn.addTarget(self, action: #selector(addMarketingBtnAction(_:)), for: .touchUpInside)
                cell.ScheduleBtn.tag = indexPath.row
                cell.ScheduleBtn.addTarget(self, action: #selector(scheduleAMettingBtnAction(_:)), for: .touchUpInside)
                return cell
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "ConnectionsTableViewCell", for: indexPath) as! ConnectionsTableViewCell
                cell.ConnectionImage.image = UIImage(named: self.sideMenuArray[indexPath.section].data[indexPath.row].image)
                cell.NameLabel.text = self.sideMenuArray[indexPath.section].data[indexPath.row].title
                cell.OccupationLabel.text = self.sideMenuArray[indexPath.section].data[indexPath.row].type
                return cell
            }
        }
    }
    
    @objc func notificationBtnAction(_ sender:UIButton) {
        switch sender.tag {
        case 0:
            MoveToNextVC(identifier: "NotificationViewController")
        case 1:
            MoveToNextVC(identifier: "NotificationViewController")
        case 2:
            MoveToNextVC(identifier: "NotificationViewController")
        default:
            break
        }
    }
    
    @objc func addMarketingBtnAction(_ sender:UIButton) {
        
    }
    
    @objc func scheduleAMettingBtnAction(_ sender:UIButton) {
        MoveToNextVC(identifier: "MyUpcommingMeetingController")
    }
    
}
