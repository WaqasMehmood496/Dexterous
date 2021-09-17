//
//  NotificationViewController.swift
//  Dexterous
//
//  Created by Macbook Air on 9/16/21.
//
struct notiStruct {
    var Name:String!
    var Time:String!
    var image:UIImage!
    var descp:String!
}
import UIKit

class NotificationViewController: UIViewController {

    @IBOutlet weak var notiTableview: UITableView!
    
    var array = [notiStruct]()
    override func viewDidLoad() {
        super.viewDidLoad()

        self.array.append(notiStruct(Name: "Review", Time: "08/20/2021 7:20 AM", image: #imageLiteral(resourceName: "Review"), descp: "Work has completed on INSERT WORK HERE "))
        
        self.array.append(notiStruct(Name: "TASK", Time: "08/20/2021 7:20 AM", image: #imageLiteral(resourceName: "Task2"), descp: "Please Provide INSERT TASK HERE"))
        
        self.array.append(notiStruct(Name: "Mentions", Time: "08/20/2021 7:20 AM", image: #imageLiteral(resourceName: "Mention"), descp: "We were mention here INSERT MENTIONS HERE, INSERT MENTIONS HERE, INSERT MENTIONS HERE "))
        
        self.array.append(notiStruct(Name: "Overdue Reminder", Time: "08/20/2021 7:20 AM", image: #imageLiteral(resourceName: "Overdue Reminder"), descp: "Please Provide INSERT REMINDER HERE"))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.navigationController?.navigationBar.isHidden = true
        self.tabBarController?.tabBar.isHidden = true

    }
    


}
extension NotificationViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NotiTableViewCell") as! NotiTableViewCell
        cell.desclbl.text = array[indexPath.row].descp!
        cell.timelinelbl.text = array[indexPath.row].Time!
        cell.titlelbl.text = array[indexPath.row].Name!
        cell.imageicon.image = array[indexPath.row].image!
        return cell

    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    
    
    
    
}
