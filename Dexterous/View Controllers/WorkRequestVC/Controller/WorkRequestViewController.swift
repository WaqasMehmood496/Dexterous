//
//  WorkRequestViewController.swift
//  Dexterous
//
//  Created by Macbook Air on 9/16/21.
//
struct WorkReqStruct {
    var name:String!
    var tag:String!
    var color:UIColor!
}
import UIKit

class WorkRequestViewController: UIViewController {

    
    @IBOutlet weak var workTableview: UITableView!
    
    
    var array = [WorkReqStruct]()
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.navigationController?.navigationBar.isHidden = true
        self.tabBarController?.tabBar.isHidden = true

    }
    override func viewDidLoad() {
        super.viewDidLoad()

        array.append(WorkReqStruct(name: "UPGARDE MY ACCOUNT", tag: "UPMain", color: UIColor(named: "App Background Theam")))
        
        
        array.append(WorkReqStruct(name: "CHANE SOMETHING ON MY WEBSITE", tag: "CH", color: UIColor(named: "Orange")))
        array.append(WorkReqStruct(name: "CREATE A NEW DESIGN", tag: "CR", color: UIColor(named: "Color")))
        array.append(WorkReqStruct(name: "CREATE A VIDEO", tag: "CV", color: UIColor(named: "Green")))
        array.append(WorkReqStruct(name: "START A NEW CAMPAIGN", tag: "ST", color: UIColor(named: "Pink")))
        array.append(WorkReqStruct(name: "UPGARDE MY ACCOUNT", tag: "UP", color: UIColor(named: "App Background Theam")))
        
        // Do any additional setup after loading the view.
    }
    

}
extension WorkRequestViewController:UITableViewDelegate,UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if array[indexPath.row].tag == "UPMain"{
            let cell = tableView.dequeueReusableCell(withIdentifier: "WorkreqTableViewCell") as! WorkreqTableViewCell
            return cell
        }
        else{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "workReq1TableViewCell") as! workReq1TableViewCell
            
            cell.cellbtn.setTitle(array[indexPath.row].name!, for: .normal)
            cell.cellbtn.backgroundColor  = array[indexPath.row].color!
            cell.cellbtn.addTarget(self, action: #selector(goto), for: .touchUpInside)
            cell.cellbtn.tag = indexPath.row
           
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    @objc func goto(_ sender:UIButton){
        
        if array[sender.tag].tag == "CH"{
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "ChangeOnWebsiteViewController") as! ChangeOnWebsiteViewController
            //controller.delegate = self
          
            self.navigationController?.pushViewController(controller, animated: true)
            
        }
        
    }
    
    
}
