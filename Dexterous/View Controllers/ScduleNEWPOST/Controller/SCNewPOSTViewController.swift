//
//  SCNewPOSTViewController.swift
//  Dexterous
//
//  Created by Macbook Air on 9/17/21.
//

import UIKit

class SCNewPOSTViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    @IBAction func backbtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
