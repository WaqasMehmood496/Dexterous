//
//  SideMenuController.swift
//  Dexterous
//
//  Created by Buzzware Tech on 14/09/2021.
//

import UIKit

class SideMenuController: UIViewController {
    
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
    
    @IBAction func EditProfileBtnAction(_ sender: Any) {
        //Move to edit profile controller
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
}


extension SideMenuController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.sideMenuArray.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 60))
        
        let label = UILabel(frame: CGRect(x: 24, y: 0, width: tableView.frame.size.width - 48, height: 50))
        label.text = self.sideMenuArray[section].groupTitle
        label.textColor = UIColor.black
        label.font = UIFont(name: "Montserrat-Bold", size: 15)
        view.backgroundColor = #colorLiteral(red: 0.8374180198, green: 0.8374378085, blue: 0.8374271393, alpha: 1)
        view.addSubview(label)
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
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
                return cell
            }
            
        } else if indexPath.section == 1 {
            //NOTIFICATIONS
            let cell = tableView.dequeueReusableCell(withIdentifier: "ConnectionsTableViewCell", for: indexPath) as! ConnectionsTableViewCell
            return cell
            
        } else {
            // OTHERS
            if indexPath.row >= sideMenuArray[indexPath.section].data.count {
                //INVITE TABLEVIEW CELL
                let cell = tableView.dequeueReusableCell(withIdentifier: "OtherTableViewCell", for: indexPath) as! OtherTableViewCell
                return cell
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "ConnectionsTableViewCell", for: indexPath) as! ConnectionsTableViewCell
                return cell
            }
        }
    }
    
}
