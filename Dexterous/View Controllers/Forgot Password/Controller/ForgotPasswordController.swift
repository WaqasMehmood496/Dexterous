//
//  ForgotPasswordController.swift
//  Dexterous
//
//  Created by Buzzware Tech on 13/09/2021.
//

import UIKit

class ForgotPasswordController: UIViewController {

    @IBOutlet weak var EmailTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setPaddingOnFields(fields: [EmailTF])
    }
    
    //IBACTION'S
    @IBAction func SubmitBtnAction(_ sender: UIButton) {
    }
    @IBAction func BackBtnAction(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
