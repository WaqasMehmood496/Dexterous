//
//  StartUpController.swift
//  Dexterous
//
//  Created by Buzzware Tech on 13/09/2021.
//

import UIKit

class StartUpController: UIViewController {
    
    @IBOutlet weak var StartUpPageControll: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // collectionViewSetup()
    }
    @IBAction func SignInBtnAction(_ sender: Any) {
        self.performSegue(withIdentifier: "SignInSegue", sender: nil)
    }
    @IBAction func SignUpBtnAction(_ sender: Any) {
        self.performSegue(withIdentifier: "BusinessSignupSegue", sender: nil)
    }
}

