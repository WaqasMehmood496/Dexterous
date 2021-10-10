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
    
    //VARIABLES
    var sideMenuArray:[SideMenuModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.sideMenuArray = [
            SideMenuModel(data: [
                SideMenuOptionModel(image: "Group 2857", title: "Jane Brown", type: "Admin"),
                SideMenuOptionModel(image: "Group 2857", title: "Pick Clarke", type: "Billing"),
                SideMenuOptionModel(image: "Group 2857", title: "Samantha Stone", type: "Design")
            ], groupTitle: "People"),
            SideMenuModel(data: [
                SideMenuOptionModel(image: "Group 2857", title: "Push", type: ""),
                SideMenuOptionModel(image: "Group 2857", title: "Products", type: ""),
                SideMenuOptionModel(image: "Group 2857", title: "Templates", type: "")
            ], groupTitle: "Dexterous"),
            SideMenuModel(data: [
                SideMenuOptionModel(image: "Group 2860", title: "Notifications", type: ""),
                SideMenuOptionModel(image: "Group 2860", title: "Teams", type: "")
            ], groupTitle: "Settings"),
            SideMenuModel(data: [
                SideMenuOptionModel(image: "Group 2865", title: "Privacy Policy", type: ""),
                SideMenuOptionModel(image: "Group 2864", title: "Terms of Service", type: ""),
                SideMenuOptionModel(image: "Group 2863", title: "Version 1.0", type: ""),
                SideMenuOptionModel(image: "Group 2863", title: "Billing", type: "")
            ], groupTitle: "Other")
        ]
        
        self.SideMenuTableView.reloadData()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func ShowProfile(_ sender: UIButton) {
        MoveToNextVC(identifier: "ProfileViewController")
    }
    
    @IBAction func EditProfileBtnAction(_ sender: UIButton) {
        if sender.tag == 0 {
            MoveToNextVC(identifier: "EditBusinessAccountController")
        } else {
            MoveToNextVC(identifier: "EditProfileController")
        }
        
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
        let vc = (self.storyboard?.instantiateViewController(withIdentifier: identifier))!
        self.sideMenuController?.hideLeftView(animated: true, completion: {
            self.sideMenuController?.rootViewController?.show(vc, sender: self)
        }) 
    }
}


extension SideMenuController: UITableViewDelegate, UITableViewDataSource {
    
    //SECTIONS METHOD'S
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
    
    
    //ROW METHOD'S
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 1 || section == 2 {
            return sideMenuArray[section].data.count
        } else {
            return sideMenuArray[section].data.count + 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            // PEOPLE
            let peopleCell = peopleSectionCell(indexPath: indexPath,tableView:tableView)
            return peopleCell
            
        } else if indexPath.section == 1 {
            //DEXTEROUS
            let dexterousCell = dexterousSectionCell(indexPath: indexPath, tableView: tableView)
            return dexterousCell
            
        }  else if indexPath.section == 2 {
            //NOTIFICATIONS
            let notificationCell = notificationsSectionCell(indexPath: indexPath, tableView: tableView)
            return notificationCell
            
        } else {
            // OTHERS
            let otherCell = otherSectionCell(indexPath: indexPath, tableView: tableView)
            return otherCell
        }
    }
}
