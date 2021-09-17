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
        
        btnidontlogo.setAttributedTitle(NSAttributedString(string: "I DON'T HAVE LOGO", attributes:
                                                            [.underlineStyle: NSUnderlineStyle.single.rawValue]), for: .normal)
        btnidonthaveweb.setAttributedTitle(NSAttributedString(string: "I DON'T HAVE WEBSITE", attributes:
                                                            [.underlineStyle: NSUnderlineStyle.single.rawValue]), for: .normal)
     


        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        
        self.navigationController?.navigationBar.isHidden = true
        self.tabBarController?.tabBar.isHidden = true

    }
    
    
    @IBAction func webbtn(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "popSignupViewController") as! popSignupViewController
        //controller.delegate = self
        controller.lblText = "Would you like to create a website?"
        self.parent?.tabBarController?.present(controller, animated: true, completion: nil)
        
        
    }
    @IBAction func logobtn(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "popSignupViewController") as! popSignupViewController
        //controller.delegate = self
        controller.lblText = "Would you like to create a Logo?"
        self.parent?.tabBarController?.present(controller, animated: true, completion: nil)
    }
    @IBAction func Nextbtn(_ sender: Any) {
    }
    
    @IBAction func signInBtn(_ sender: Any) {
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
