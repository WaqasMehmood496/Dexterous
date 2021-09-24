//
//  AutoVCCViewController.swift
//  Dexterous
//
//  Created by Macbook Air on 9/17/21.
//

import UIKit

class AutoVCCViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = true
    }
    
    @IBAction func backbtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func addbtn(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "popviewViewController") as! popviewViewController
        //controller.delegate = self
        controller.array = ["Bookmark","Share","Edit","Move","Copy","Delete","Change Log","Cancel"]
        controller.isredirectFrom = "MEDIA"
        self.parent?.tabBarController?.present(controller, animated: true, completion: nil)
        
    }
    
}
extension AutoVCCViewController:UITableViewDelegate,UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "Automation1TableViewCell") as! Automation1TableViewCell
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "Messge3TableViewCell") as! Messge3TableViewCell
            cell.celllbl.text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry"
            
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "Messge3TableViewCell") as! Messge3TableViewCell
            cell.celllbl.text = "Lorem Ipsum is simply dummy text."
            return cell
        default:
            return UITableViewCell()
        }
    }
}
