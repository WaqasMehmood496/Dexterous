//
//  SignupController.swift
//  Dexterous
//
//  Created by Buzzware Tech on 13/09/2021.
//

import UIKit

class SignupController: UIViewController {
    
    // IBACTION'S
    @IBOutlet weak var FirstNameTF: UITextField!
    @IBOutlet weak var LastNameTF: UITextField!
    @IBOutlet weak var EmailTF: UITextField!
    @IBOutlet weak var PasswordTF: UITextField!
    
    // CONSTANT
    var window: UIWindow?
    // VARIABLE
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setPaddingOnFields(fields: [FirstNameTF,LastNameTF,EmailTF,PasswordTF])
    }
    
    // IBACTION'S
    @IBAction func UploadProfileImageBtnAction(_ sender: UIButton) {
        
    }
    @IBAction func SignUpBtnAction(_ sender: UIButton) {
        if let window = window {
//            changeRootViewController(identifier: "TabbarController", window: window)
        }
    }
    @IBAction func SignInBtnAction(_ sender: UIButton) {
        self.performSegue(withIdentifier: "SignupTologinSegue", sender: nil)
    }
    @IBAction func BackBtnAction(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
