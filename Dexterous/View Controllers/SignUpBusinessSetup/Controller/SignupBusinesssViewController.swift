//
//  SignupBusinesssViewController.swift
//  Dexterous
//
//  Created by Macbook Air on 9/17/21.
//

import UIKit
import Photos

class SignupBusinesssViewController: UIViewController {
    
    //IBOUTLET'S
    @IBOutlet weak var btnidontlogo: UIButton!
    @IBOutlet weak var btnidonthaveweb: UIButton!
    @IBOutlet weak var bwebtf: UITextField!
    @IBOutlet weak var bnumbertf: UITextField!
    @IBOutlet weak var bemailtf: UITextField!
    @IBOutlet weak var SelectedImageNamelabel: UILabel!
    
    //VARIABLE'S
    var selectedImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setPaddingOnFields(fields: [bwebtf,bnumbertf,bemailtf])
        addButtonUnderlineOnText(button: btnidontlogo, text: "I DON'T HAVE A LOGO")
        addButtonUnderlineOnText(button: btnidonthaveweb, text: "I DON'T HAVE A WEBSITE")
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
        takePhoto(btn: sender, title: "Upload logo?")
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
    
    func setupTextfieldDelegate(){
        bwebtf.delegate = self
        bemailtf.delegate = self
        bnumbertf.delegate = self
    }
    
}

extension SignupBusinesssViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField.tag == 0 {
            if textField.text?.count == 0 {
                textField.text = "http://"
            }
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField.tag == 2 {
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


extension SignupBusinesssViewController {
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
                self.SelectedImageNamelabel.text = (imageName as! String)
            }
        }
        
        picker.dismiss(animated: true, completion: nil)
    }
}
