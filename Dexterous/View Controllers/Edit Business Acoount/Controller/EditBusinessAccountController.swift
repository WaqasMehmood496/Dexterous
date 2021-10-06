//
//  EditBusinessAccountController.swift
//  Dexterous
//
//  Created by Mac on 04/10/2021.
//

import UIKit
import Photos

class EditBusinessAccountController: UIViewController {

    //IBOUTLET'S
    @IBOutlet weak var BusinessLogo: UIImageView!
    
    //VARIABLE'S
    @IBOutlet weak var BusinessURLTF: UITextField!
    @IBOutlet weak var BusinessNameTF: UITextField!
    @IBOutlet weak var BusinessPhoneNumberTF: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    //IBATION'S
    @IBAction func SaveBtnAction(_ sender: UIButton) {
        
    }
    @IBAction func BackBtnAction(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func UploadBtnAction(_ sender: UIButton) {
        takePhoto(btn: sender, title: "Upload logo?")
    }
}


extension EditBusinessAccountController {
    
    func imagePickerController(
        _ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]
    ) {
        
        if let editedImage = info[.editedImage] as? UIImage {
            self.BusinessLogo.image = editedImage
        } else if let originalImage = info[.originalImage] as? UIImage {
            self.BusinessLogo.image = originalImage
        }
        
        picker.dismiss(animated: true, completion: nil)
    }
}
