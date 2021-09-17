//
//  ChatvccViewController.swift
//  Dexterous
//
//  Created by Macbook Air on 9/15/21.
//

import UIKit

class ChatvccViewController: UIViewController {

    @IBOutlet weak var chatTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        
    self.navigationController?.navigationBar.isHidden = true
    self.tabBarController?.tabBar.isHidden = false

    }
    
    @IBAction func addbtn(_ sender: Any) {
        
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "popviewViewController") as! popviewViewController
        //controller.delegate = self
        controller.array = ["New Chat","Direct Message","Mentions","Search","Cancel"]
        controller.isredirectFrom = "MEDIA"
        self.parent?.tabBarController?.present(controller, animated: true, completion: nil)
        
        
    }
    
    @IBAction func searchbtn(_ sender: Any) {
    }
    
    

}
extension ChatvccViewController:UITableViewDelegate,UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChatListTableViewCell") as! ChatListTableViewCell
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "MessageViewController") as! MessageViewController
     
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    
    
    
    
}
