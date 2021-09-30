//
//  MediaTypeDetailViewController.swift
//  Dexterous
//
//  Created by Buzzware Tech on 15/09/2021.
//

import UIKit

class MediaTypeDetailViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.tabBar.isHidden = true
        // Do any additional setup after loading the view.
    }
    
    override func viewWillLayoutSubviews() {
        self.freeTrailPopUp()
    }
    
    @IBAction func BackBtnAction(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
