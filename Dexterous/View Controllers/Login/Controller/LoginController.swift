//
//  LoginController.swift
//  Dexterous
//
//  Created by Buzzware Tech on 13/09/2021.
//

import UIKit

class LoginController: UIViewController {
    
    //IBOUTLET'S
    @IBOutlet weak var EmailTF: UITextField!
    @IBOutlet weak var PasswordTF: UITextField!
    
    //CONSTANTS
    
    //VARIABLES
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setPaddingOnFields(fields: [EmailTF,PasswordTF])
    }
    
    //IBACTIONS
    @IBAction func BackBtn(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func LoginBtnAction(_ sender: UIButton) {
    }
    @IBAction func ForgotBtnAction(_ sender: UIButton) {
    }
    @IBAction func GmailBtnAction(_ sender: UIButton) {
    }
    @IBAction func FacebookBtnAction(_ sender: UIButton) {
    }
    @IBAction func LinkedInBtnAction(_ sender: UIButton) {
    }
    @IBAction func TwitterBtnAction(_ sender: UIButton) {
    }
    @IBAction func SignupBtnAction(_ sender: UIButton) {
    }
    
}
