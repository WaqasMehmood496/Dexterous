//
//  ProfileViewController.swift
//  Dexterous
//
//  Created by Macbook Air on 9/16/21.
//

struct profie{
    var Name:String!
    var Title:String!
    var Image:UIImage!
}

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var downTf: UITextField!
    @IBOutlet weak var profileTableView: UITableView!
    
    
    var array = [profie]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        array.append(profie(Name: "Main", Title: "Elizabeth Olsen", Image: #imageLiteral(resourceName: "Name")))
        
        array.append(profie(Name: "Full Name", Title: "Elizabeth Olsen", Image: #imageLiteral(resourceName: "Name")))
        array.append(profie(Name: "Email Address", Title: "Elizabetholsen@hotmail.com", Image: #imageLiteral(resourceName: "Group 2861")))
        array.append(profie(Name: "Phone Number", Title: "+98 123 4567 89", Image: #imageLiteral(resourceName: "Phone")))
        array.append(profie(Name: "Password", Title: "***********", Image: #imageLiteral(resourceName: "Password")))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
        self.freeTrailPopUp()
    }
    
    //MARK:- IBOUTLETS
    @IBAction func backBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func shareBtn(_ sender: Any) {
    }
    
}

extension ProfileViewController:UITableViewDelegate,UITableViewDataSource{
    
    //SECTIONS METHODS
    func numberOfSections(in tableView: UITableView) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 6 {
            return 0
        } else {
            return 30
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let profileView = Bundle.main.loadNibNamed("DashboardHeader", owner: self, options: nil)?.first as! DashboardHeader
        if section == 0 {
            profileView.HeaderLabel.text = "Personal Information"
        } else if section == 1 {
            profileView.HeaderLabel.text = "Recent Files"
        } else if section == 2 {
            profileView.HeaderLabel.text = "Storage Usage"
        } else if section == 3 {
            profileView.HeaderLabel.text = "Active Stats"
        } else if section == 4 {
            profileView.HeaderLabel.text = "My Tasks"
        } else if section == 5 {
            profileView.HeaderLabel.text = "Recent Chats"
        } else {
            profileView.HeaderLabel.text = ""
        }
        profileView.HeaderButton.isHidden = true
        
        return profileView
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return self.array.count
        } else if section == 1 {
            return 1
        } else if section == 2 {
            return 1
        } else if section == 3 {
            return 1
        } else if section == 4 {
            return 3
        } else if section == 5 {
            return 3
        } else {
            return 1
        }
        
    }
    
    //ROW METHODS
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            if array[indexPath.row].Name == "Main" {
                let cell = tableView.dequeueReusableCell(withIdentifier: "profile1TableViewCell") as! profile1TableViewCell
                return cell
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "profile2TableViewCell") as! profile2TableViewCell
                cell.imageicon.image = array[indexPath.row].Image
                cell.lbltitle.text = array[indexPath.row].Name
                cell.lbltitle_ame.text = array[indexPath.row].Title
                return cell
            }
            
        } else if indexPath.section == 1 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "RecentFileUploadCell") as! RecentFileUploadCell
            return cell
            
        } else if indexPath.section == 2 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "StorageCell") as! StorageCell
            return cell
            
        } else if indexPath.section == 3 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "ActiveUserCell") as! ActiveUserCell
            return cell
            
        } else if indexPath.section == 4 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "DashboardMyTaskCell") as! DashboardMyTaskCell
            return cell
            
        } else if indexPath.section == 5 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ChatListTableViewCell") as! ChatListTableViewCell
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "OthersOptionCell") as! OthersOptionCell
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
