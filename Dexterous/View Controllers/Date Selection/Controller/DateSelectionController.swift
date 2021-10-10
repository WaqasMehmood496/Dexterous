//
//  DateSelectionController.swift
//  Dexterous
//
//  Created by Mac on 08/10/2021.
//

import UIKit

class DateSelectionController: UIViewController {
    
    @IBOutlet weak var DateSelectionView: UIDatePicker!
    
    var delegate = TiervViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func DoneBtnAction(_ sender: UIButton) {
        self.dismiss(animated: true) {
            self.delegate.tempRecordAdd(recordName: "")
        }
    }
    
    @IBAction func AssignLaterBtnAction(_ sender: UIButton) {
        self.dismiss(animated: true) {
            self.delegate.tempRecordAdd(recordName: "")
        }
    }
    
    @IBAction func DateSelectionViewAction(_ sender: UIDatePicker) {
        print(sender.date)
    }
    
    @IBAction func CloseTapGuesture(_ sender: UITapGestureRecognizer) {
        self.dismiss(animated: true) {
            
        }
    }
}
