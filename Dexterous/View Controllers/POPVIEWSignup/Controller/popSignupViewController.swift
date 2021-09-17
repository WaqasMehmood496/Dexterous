//
//  popSignupViewController.swift
//  Dexterous
//
//  Created by Macbook Air on 9/17/21.
//

import UIKit

class popSignupViewController: UIViewController {

    var lblText:String!
    @IBOutlet weak var lblpopUp: UILabel!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.lblpopUp.text = lblText
        // Do any additional setup after loading the view.
    }
    
    @IBAction func yesbtn(_ sender: Any) {
    }
    @IBAction func notbtn(_ sender: Any) {
    
        self.dismiss(animated: true, completion: nil)
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
