//
//  SaveTemplateController.swift
//  Dexterous
//
//  Created by Mac on 08/10/2021.
//

import UIKit

class SaveTemplateController: UIViewController {
    
    //IBOUTLET'S
    @IBOutlet weak var TemplateNameTF: UITextField!
    
    //VARIABLE'S
    var delegate = TiervViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func SaveBtnAction(_ sender: UIButton) {
        self.dismiss(animated: true) {
            self.delegate.saveTemplate(templateName: "")
        }
    }
    
    @IBAction func CancelBtnAction(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func DismisTapGestureAction(_ sender: UITapGestureRecognizer) {
        
        self.dismiss(animated: true, completion: nil)
        
    }
}
