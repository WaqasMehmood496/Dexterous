//
//  popSignupViewController.swift
//  Dexterous
//
//  Created by Macbook Air on 9/17/21.
//

import UIKit

class popSignupViewController: UIViewController {
    
    //IBOUTLET'S
    @IBOutlet weak var lblpopUp: UILabel!
    
    //CONSTANT'S
    var lblText:String!
    //VARIABLE'S
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.lblpopUp.text = lblText
    }
    
    @IBAction func yesbtn(_ sender: Any) {
    }
    @IBAction func notbtn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func DismisViewControllerTapGesture(_ sender: UITapGestureRecognizer) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
