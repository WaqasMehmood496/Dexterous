//
//  WhichTeamViewController.swift
//  Dexterous
//
//  Created by Macbook Air on 9/16/21.
//

import UIKit

class WhichTeamViewController: UIViewController {
    @IBOutlet weak var whichtableview: UITableView!
    
    var array = [WorkReqStruct]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        array.append(WorkReqStruct(name: "UPGARDE MY ACCOUNT", tag: "UPMain", color: UIColor(named: "App Background Theam")))
        array.append(WorkReqStruct(name: "ADMIN TEAM", tag: "CH", color: UIColor(named: "App Background Theam")))
        array.append(WorkReqStruct(name: "WEB TEAM", tag: "CH", color: UIColor(named: "Orange")))
        array.append(WorkReqStruct(name: "DESIGN TEAM", tag: "CH", color: UIColor(named: "Purple")))
        array.append(WorkReqStruct(name: "SEO TEAM", tag: "CH", color: UIColor(named: "Pink")))
        array.append(WorkReqStruct(name: "VIDEO TEAM", tag: "CH", color: UIColor(named: "Green")))
        array.append(WorkReqStruct(name: "SOCIAL TEAM", tag: "CH", color: UIColor(named: "Color")))
        array.append(WorkReqStruct(name: "CUSTOM TEAM", tag: "CH", color: UIColor(named: "Gray")))
        
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
        self.tabBarController?.tabBar.isHidden = true
    }
    
    @IBAction func backbtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
extension WhichTeamViewController:UITableViewDelegate,UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if array[indexPath.row].tag == "UPMain"{
            let cell = tableView.dequeueReusableCell(withIdentifier: "WorkreqTableViewCell") as! WorkreqTableViewCell
            return cell
        } else {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "workReq1TableViewCell") as! workReq1TableViewCell
            
            cell.cellbtn.setTitle(array[indexPath.row].name!, for: .normal)
            cell.cellbtn.backgroundColor  = array[indexPath.row].color!
            
            cell.cellbtn.tag = indexPath.row
            
            return cell
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
}
