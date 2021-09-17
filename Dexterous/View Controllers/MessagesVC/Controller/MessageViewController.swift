//
//  MessageViewController.swift
//  Dexterous
//
//  Created by Macbook Air on 9/15/21.
//

import UIKit

class MessageViewController: UIViewController {
    @IBOutlet weak var messgeTableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
         self.tabBarController?.tabBar.isHidden = true

        self.navigationController?.navigationBar.isHidden = true
    }
    @IBAction func backbtn(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
        
    }
    
    @IBAction func addbtn(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "popviewViewController") as! popviewViewController
        controller.delegate2 = self
        controller.array = ["Add Team","Add Teammate","Edit Chat(Name this chat,description)","Share","Delete","Cancel"]
        controller.isredirectFrom = "CHAT"
        self.parent?.tabBarController?.present(controller, animated: true, completion: nil)
    }
    
    func gotoNext(){
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "EditTeamViewController") as! EditTeamViewController
    
        self.navigationController?.pushViewController(controller, animated: true)
    }
}
extension MessageViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "Messge1TableViewCell") as! Messge1TableViewCell
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "Message2TableViewCell") as! Message2TableViewCell
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "Messge3TableViewCell") as! Messge3TableViewCell
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    
    
    
}

