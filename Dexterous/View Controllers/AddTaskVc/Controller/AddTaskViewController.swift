//
//  AddTaskViewController.swift
//  Dexterous
//
//  Created by Macbook Air on 9/14/21.
//

import UIKit

class AddTaskViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = true
    }
    
    
    
    @IBAction func cancelbtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func donebtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)

    }
    @IBAction func tierBtn(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "TiervViewController") as! TiervViewController
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    @IBAction func CalanderBtnAction(_ sender: Any) {
        MoveToNextVC(identifier: "MediaCalenderViewController")
    }

}



//MARK:- HELPING METHODS
extension AddTaskViewController {
    func MoveToNextVC(identifier:String)  {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(identifier: identifier)
        self.navigationController?.pushViewController(controller, animated: true)
    }
}
