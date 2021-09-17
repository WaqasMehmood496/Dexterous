//
//  popedituserViewController.swift
//  Dexterous
//
//  Created by Macbook Air on 9/17/21.
//

import UIKit

class popedituserViewController: UIViewController {

    @IBOutlet weak var lblchangeterm: UILabel!
    @IBOutlet weak var lbledit: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblchangeterm.attributedText = NSAttributedString(string: "Change Terms", attributes:
                                                            [.underlineStyle: NSUnderlineStyle.single.rawValue])

        lbledit.attributedText = NSAttributedString(string: "Edit Permissions", attributes:
                                                            [.underlineStyle: NSUnderlineStyle.single.rawValue])
        // Do any additional setup after loading the view.
    }
    
    @IBAction func areusurebtn(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
    }
    

}
