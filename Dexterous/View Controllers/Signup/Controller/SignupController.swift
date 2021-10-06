//
//  SignupController.swift
//  Dexterous
//
//  Created by Buzzware Tech on 13/09/2021.
//

import UIKit
import Photos

class SignupController: UIViewController {
    
    // IBACTION'S
    @IBOutlet weak var FirstNameTF: UITextField!
    @IBOutlet weak var LastNameTF: UITextField!
    @IBOutlet weak var EmailTF: UITextField!
    @IBOutlet weak var PasswordTF: UITextField!
    @IBOutlet weak var SelectedImageNamelabel: UILabel!
    
    // VARIABLE
    var window: UIWindow?
    var selectedImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //addKeyboardObserverForScreenMoving()
        setPaddingOnFields(fields: [FirstNameTF,LastNameTF,EmailTF,PasswordTF])
        PasswordTF.delegate = self
    }
    
    // IBACTION'S
    @IBAction func UploadProfileImageBtnAction(_ sender: UIButton) {
        takePhoto(btn: sender, title: "Upload profile photo?")
    }
    @IBAction func SignUpBtnAction(_ sender: UIButton) {
        if let window = window {
            //            changeRootViewController(identifier: "TabbarController", window: window)
        }
    }
    @IBAction func SignInBtnAction(_ sender: UIButton) {
        self.performSegue(withIdentifier: "SignupTologinSegue", sender: nil)
    }
    @IBAction func BackBtnAction(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}

extension SignupController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField.tag == 3 {
            if textField.text?.count == 3 {
                textField.text?.append(contentsOf: "-")
                return true
            } else {
                let maxLength = 10
                let currentString: NSString = textField.text! as! NSString
                let newString: NSString =
                currentString.replacingCharacters(in: range, with: string) as NSString
                return newString.length <= maxLength
            }
        }
        return false
    }
}

extension SignupController {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let editedImage = info[.editedImage] as? UIImage {
            self.selectedImage = editedImage
        } else if let originalImage = info[.originalImage] as? UIImage {
            self.selectedImage = originalImage
        }
        
        
        if let imageURL = info[UIImagePickerController.InfoKey.referenceURL] as? URL {
            let result = PHAsset.fetchAssets(withALAssetURLs: [imageURL], options: nil)
            let asset = result.firstObject
            if let imageName = asset?.value(forKey: "filename"){
                self.SelectedImageNamelabel.text = imageName as! String
            }
            
        }
        
        picker.dismiss(animated: true, completion: nil)
    }
}
