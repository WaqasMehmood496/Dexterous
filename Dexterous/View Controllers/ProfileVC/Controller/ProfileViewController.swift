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

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    //MARK:- IBOUTLETS
    @IBAction func backBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func shareBtn(_ sender: Any) {
    }
    
}

extension ProfileViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if array[indexPath.row].Name == "Main"{
            let cell = tableView.dequeueReusableCell(withIdentifier: "profile1TableViewCell") as! profile1TableViewCell
            
            return cell
        }
        else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "profile2TableViewCell") as! profile2TableViewCell
            
            cell.imageicon.image = array[indexPath.row].Image
            cell.lbltitle.text = array[indexPath.row].Name
            cell.lbltitle_ame.text = array[indexPath.row].Title
            
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

}
