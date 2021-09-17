//
//  CardPaymentController.swift
//  Dexterous
//
//  Created by Buzzware Tech on 17/09/2021.
//

import UIKit

class CardPaymentController: UIViewController {

    @IBOutlet weak var CardPaymentTF: UITextField!
    @IBOutlet weak var CardNumberTF: UITextField!
    @IBOutlet weak var DateTF: UITextField!
    @IBOutlet weak var CCITF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setPaddingOnFields(fields: [CardPaymentTF,CardNumberTF,DateTF,CCITF])
    }

    @IBAction func BackBtnAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
