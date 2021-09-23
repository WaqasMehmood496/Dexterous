//
//  SignupBusinesssViewController.swift
//  Dexterous
//
//  Created by Macbook Air on 9/17/21.
//

import UIKit

class SignupBusinesssViewController: UIViewController {
    
    @IBOutlet weak var btnidontlogo: UIButton!
    @IBOutlet weak var btnidonthaveweb: UIButton!
    @IBOutlet weak var bwebtf: UITextField!
    @IBOutlet weak var bnumbertf: UITextField!
    @IBOutlet weak var bemailtf: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setPaddingOnFields(fields: [bwebtf,bnumbertf,bemailtf])
        addButtonUnderlineOnText(button: btnidontlogo, text: "I DON'T HAVE LOGO")
        addButtonUnderlineOnText(button: btnidonthaveweb, text: "I DON'T HAVE WEBSITE")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
        self.tabBarController?.tabBar.isHidden = true
    }
    
    @IBAction func webbtn(_ sender: Any) {
        presentPopup(message: "Would you like to create a Website?")
    }
    
    @IBAction func logobtn(_ sender: Any) {
        presentPopup(message: "Would you like to create a Logo?")
    }
    
    @IBAction func Nextbtn(_ sender: Any) {
        self.performSegue(withIdentifier: "BusinessToSignupSegue", sender: nil)
    }
    
    @IBAction func signInBtn(_ sender: Any) {
        self.performSegue(withIdentifier: "businessToSignIm", sender: nil)
    }
    
    @IBAction func UploadPhotoBtnAction(_ sender: UIButton) {
    }
    
    @IBAction func BackBtnAction(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}


//MARK:- HELPING METHOD'S
extension SignupBusinesssViewController {
    
    func addButtonUnderlineOnText (button:UIButton, text:String) {
        button.setAttributedTitle(NSAttributedString(string: text, attributes: [
            .underlineStyle: NSUnderlineStyle.single.rawValue
        ]), for: .normal)
    }
    
    func presentPopup(message:String) {
        let controller = getViewController(identifier: "popSignupViewController") as! popSignupViewController
        controller.lblText = message
        self.present(controller, animated: true, completion: nil)
    }
    
}
