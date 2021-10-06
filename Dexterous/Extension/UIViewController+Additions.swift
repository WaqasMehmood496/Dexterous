//
//  UIViewController+Additions.swift
//  TradeAir
//
//  Created by Adeel on 08/10/2019.
//  Copyright © 2019 Buzzware. All rights reserved.
//

import UIKit
import PhotosUI
import SwiftEntryKit
import JGProgressHUD

class UIViewController_Additions: NSObject {
    
}
extension UIResponder {
    
    func showHUDView(hudIV: hudIndicatorView,text: hudText,completion: ((JGProgressHUD)->())? = nil){
        let hud = JGProgressHUD()
        
        hud.interactionType = .blockAllTouches
        hud.animation = JGProgressHUDFadeZoomAnimation.init()
        switch hudIV {
        case .indeterminate:
            hud.indicatorView = JGProgressHUDIndeterminateIndicatorView.init()
        case .success:
            hud.indicatorView = JGProgressHUDSuccessIndicatorView.init()
        case .pie:
            hud.indicatorView = JGProgressHUDPieIndicatorView.init()
        case .error:
            hud.indicatorView = JGProgressHUDErrorIndicatorView.init()
        case .image:
            hud.indicatorView = JGProgressHUDImageIndicatorView.init()
        case .ring:
            hud.indicatorView = JGProgressHUDRingIndicatorView.init()
        }
        
        switch text {
        case .load:
            hud.textLabel.text = text.rawValue
        case .process:
            hud.textLabel.text = text.rawValue
        case .complete:
            hud.textLabel.text = text.rawValue
        case .success:
            hud.textLabel.text = text.rawValue
        case .error:
            hud.textLabel.text = text.rawValue
        case .evaluating:
            hud.textLabel.text = text.rawValue
        case .LoadingTastybox:
            hud.textLabel.text = text.rawValue
        }
        
        completion?(hud)
    }
}
extension UIViewController {
    
    
    
    @IBAction func backAction() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func dismissVCAction() {
        self.dismiss(animated: true) {
        }
    }
    
    func showAlert(message: String){
        let alert = UIAlertView()
        alert.title = "Alert"
        alert.message = message
        alert.addButton(withTitle: "OK")
        alert.show()
    }
    
    func takePhoto(btn:UIButton,title:String){
        let photos = PHPhotoLibrary.authorizationStatus()
        if photos == .notDetermined {
            PHPhotoLibrary.requestAuthorization({status in
                if status == .authorized{
                    print("OKAY")
                } else {
                    print("NOTOKAY")
                }
            })
        }
        checkLibrary(btn: btn,title: title)
        checkPermission(btn: btn,title: title)
    }
    
    func getViewController(identifier:String) -> UIViewController {
        var storyboard :UIStoryboard!
        if UIDevice.current.userInterfaceIdiom == .phone {
            storyboard = UIStoryboard(name: "Main", bundle: nil)
        } else {
            storyboard = UIStoryboard(name: "Ipad", bundle: nil)
        }
        let controller = storyboard.instantiateViewController(identifier: identifier)
        
        return controller
    }
    
    func changeRootViewController(identifier:String) {
        var storyboard :UIStoryboard!
        if UIDevice.current.userInterfaceIdiom == .phone {
            storyboard = UIStoryboard(name: "Main", bundle: nil)
        } else {
            storyboard = UIStoryboard(name: "Ipad", bundle: nil)
        }
        let controller = storyboard.instantiateViewController(identifier: identifier)
        UIApplication.shared.windows.first?.rootViewController = controller
        UIApplication.shared.windows.first?.makeKeyAndVisible()
    }
    
    //MARK: SHOW TOP STATUS BAR MESSAGE USING SWIFT ENTITY KIT
    func freeTrailPopUp() {
        //Check date
        let attributes = ekattributes()
        let date = DateTimeHelper.sharedInstance.GetDateFromString(DateStr: "2021-09-27")
        let daysLeft = date.timeAgoSinceDate(false)
        print(daysLeft)
        if daysLeft == "1 days" {
            showStatusBarMessage(attributes: attributes,message: Constant.yourTrialEndsIn15days)
        } else if daysLeft == "2 days" {
            showStatusBarMessage(attributes: attributes,message: Constant.yourTrialEndsIn14days)
        } else if daysLeft == "3 days" {
            showStatusBarMessage(attributes: attributes,message: Constant.yourTrialEndsIn13days)
        } else if daysLeft == "4 days" {
            showStatusBarMessage(attributes: attributes,message: Constant.yourTrialEndsIn12days)
        } else if daysLeft == "5 days" {
            showStatusBarMessage(attributes: attributes,message: Constant.yourTrialEndsIn11days)
        } else if daysLeft == "6 days" {
            showStatusBarMessage(attributes: attributes,message: Constant.yourTrialEndsIn10days)
        } else if daysLeft == "7 days" {
            showStatusBarMessage(attributes: attributes,message: Constant.yourTrialEndsIn9days)
        } else if daysLeft == "8 days" {
            showStatusBarMessage(attributes: attributes,message: Constant.yourTrialEndsIn8days)
        } else if daysLeft == "9 days" {
            showStatusBarMessage(attributes: attributes,message: Constant.yourTrialEndsIn7days)
        } else if daysLeft == "10 days" {
            showStatusBarMessage(attributes: attributes,message: Constant.yourTrialEndsIn6days)
        } else if daysLeft == "11 days" {
            showStatusBarMessage(attributes: attributes,message: Constant.yourTrialEndsIn5days)
        } else if daysLeft == "12 days" {
            showStatusBarMessage(attributes: attributes,message: Constant.yourTrialEndsIn4days)
        } else if daysLeft == "13 days" {
            showStatusBarMessage(attributes: attributes,message: Constant.yourTrialEndsIn3days)
        } else if daysLeft == "14 days" {
            showStatusBarMessage(attributes: attributes,message: Constant.yourTrialEndsIn2days)
        } else if daysLeft == "15 days" {
            showStatusBarMessage(attributes: attributes,message: Constant.yourTrialEndsTomorrow)
        } else {
            showStatusBarMessage(attributes: attributes,message: Constant.yourTrialHasExpired)
        }
        
    }
    
    func ekattributes () -> EKAttributes {
        var attributes = EKAttributes()
        attributes.name = "Top Note"
        attributes.windowLevel = .custom(level: UIWindow.Level.init(0.0))
        attributes.position = .top
        attributes.displayDuration = .infinity
        let action = {
            print("Top note is selected")
            let pricingPage = self.getViewController(identifier: "MediaTypePurchasingController") as! MediaTypePurchasingController
            pricingPage.product = ProductModel(
                mediaType: "Video", mediaLogo: "Vid", mediaColor: "Green", produtsTypes: [
                ProductTypesModel(title: "Get Started", price: "$1500", benifit: ["5 Keywords","1 Blog per month","On-site SEO: included such as SCHEMA Markup link structure, meta More"])
            ])
            self.navigationController?.pushViewController(pricingPage, animated: true)
        }
        attributes.entryInteraction.customTapActions.append(action)
        return attributes
    }
    
    private func showStatusBarMessage(attributes: EKAttributes,message:String) {
        let statusBarHeight = UIApplication.shared.statusBarFrame.maxY + 10
        let contentView: UIView
        let labelStyle = EKProperty.LabelStyle(font: UIFont(name: "Montserrat-Medium", size: 14)!, color: .white,displayMode: .inferred)
        var labelContent = EKProperty.LabelContent(
            text: message, style: labelStyle
        )
        labelContent.style.alignment = .center
        let noteView = EKNoteMessageView(with: labelContent)
        noteView.verticalOffset = 0
        noteView.set(.height, of: statusBarHeight)
        noteView.backgroundColor = UIColor(named: "Gray")
        contentView = noteView
        SwiftEntryKit.display(entry: contentView, using: attributes)
    }
    
    func addKeyboardObserverForScreenMoving() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
}


extension UIViewController {
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
}


extension UIViewController:UIImagePickerControllerDelegate, UINavigationControllerDelegate, UNUserNotificationCenterDelegate{
    func displayUploadImageDialog(btnSelected: UIButton,title:String) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        let alertController = UIAlertController(title: "", message: title, preferredStyle: .actionSheet)
        let cancelAction = UIAlertAction(title: NSLocalizedString("Cancel", comment: "Cancel action"), style: .cancel, handler: {(_ action: UIAlertAction) -> Void in
            alertController.dismiss(animated: true) {() -> Void in }
        })
        alertController.addAction(cancelAction)
        let cameraRollAction = UIAlertAction(title: NSLocalizedString("Open library", comment: "Open library action"), style: .default, handler: {(_ action: UIAlertAction) -> Void in
            if UI_USER_INTERFACE_IDIOM() == .pad {
                OperationQueue.main.addOperation({() -> Void in
                    picker.sourceType = .photoLibrary
                    self.present(picker, animated: true) {() -> Void in }
                })
            }
            else {
                picker.sourceType = .photoLibrary
                self.present(picker, animated: true) {() -> Void in }
            }
        })
        alertController.addAction(cameraRollAction)
        let cameraAction = UIAlertAction(title: NSLocalizedString("Camera", comment: "Camera"), style: .default) { (alertAction) in
            if UIImagePickerController.isSourceTypeAvailable(.camera){
                if UI_USER_INTERFACE_IDIOM() == .pad {
                    OperationQueue.main.addOperation({() -> Void in
                        picker.sourceType = .camera
                        self.present(picker, animated: true) {() -> Void in }
                    })
                }
                else {
                    
                    picker.sourceType = .camera
                    self.present(picker, animated: true) {() -> Void in }
                }
            }
            else{
                
            }
            
        }
        alertController.addAction(cameraAction)
        alertController.view.tintColor = .black
        if UIDevice.current.userInterfaceIdiom == .pad{
            alertController.modalPresentationStyle = .popover
            if let popoverPresentationController = alertController.popoverPresentationController {
                
                popoverPresentationController.permittedArrowDirections = .left
                popoverPresentationController.sourceView = btnSelected
                alertController.preferredContentSize = CGSize(width: UIScreen.main.bounds.width/5, height: UIScreen.main.bounds.height/9)
                popoverPresentationController.sourceRect = btnSelected.frame
            }
        }
        present(alertController, animated: true) {() -> Void in }
    }
    
    
    
    //    func checkLocationPermission() -> Bool{
    //        let authStatus = CLLocationManager.authorizationStatus()
    //        switch authStatus {
    //
    //        case .authorizedWhenInUse, .authorizedAlways:
    //            return true
    //        case .denied:
    //            print("Error")
    //            let manag = CLLocationManager()
    //            manag.requestLocation()
    //
    //            return false
    //        default:
    //            return false
    //        }
    //    }
    func checkPermission(btn: UIButton,title:String) {
        let authStatus = AVCaptureDevice.authorizationStatus(for: AVMediaType.video)
        switch authStatus {
        case .authorized:
            self.displayUploadImageDialog(btnSelected: btn,title: title)
        case .denied:
            print("Error")
        default:
            break
        }
    }
    public func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    func checkLibrary(btn:UIButton,title:String) {
        let photos = PHPhotoLibrary.authorizationStatus()
        if photos == .authorized {
            switch photos {
            case .authorized:
                self.displayUploadImageDialog(btnSelected: btn,title: title)
            case .denied:
                print("Error")
            default:
                break
            }
        }
    }
    
    func setPaddingOnFields(fields:[UITextField]) {
        for field in fields {
            field.setLeftPaddingPoints(8)
            field.setRightPaddingPoints(8)
        }
    }
}
enum hudText:String{
    case load = "Loading..."
    case process = "Processing..."
    case complete = "Completeing..."
    case success = "Success"
    case error = "Error"
    case evaluating = "Evaluating..."
    case LoadingTastybox = "Loading Tastybox..."
}
enum hudIndicatorView{
    case indeterminate,success,pie,error,image,ring
}
extension UIViewController{
    //    func showHUDView(hudIV: hudIndicatorView,text: hudText,completion: ((JGProgressHUD)->())? = nil){
    //        let hud = JGProgressHUD()
    //
    //        hud.interactionType = .blockAllTouches
    //        hud.animation = JGProgressHUDFadeZoomAnimation.init()
    //        switch hudIV {
    //        case .indeterminate:
    //            hud.indicatorView = JGProgressHUDIndeterminateIndicatorView.init()
    //        case .success:
    //            hud.indicatorView = JGProgressHUDSuccessIndicatorView.init()
    //        case .pie:
    //            hud.indicatorView = JGProgressHUDPieIndicatorView.init()
    //        case .error:
    //            hud.indicatorView = JGProgressHUDErrorIndicatorView.init()
    //        case .image:
    //            hud.indicatorView = JGProgressHUDImageIndicatorView.init()
    //        case .ring:
    //            hud.indicatorView = JGProgressHUDRingIndicatorView.init()
    //        }
    //
    //        switch text {
    //        case .load:
    //            hud.textLabel.text = text.rawValue
    //        case .process:
    //            hud.textLabel.text = text.rawValue
    //        case .complete:
    //            hud.textLabel.text = text.rawValue
    //        case .success:
    //            hud.textLabel.text = text.rawValue
    //        case .error:
    //            hud.textLabel.text = text.rawValue
    //        case .evaluating:
    //            hud.textLabel.text = text.rawValue
    //        }
    //
    //        completion?(hud)
    //
    //
    //    }
    func imagetoString(image:UIImage) -> String{
        let data = image.pngData()
        let str = data!.base64EncodedString()
        return str
    }
    func rationalApproximationOf(x0 : Double, withPrecision eps : Double = 1.0E-6) -> Rational {
        var x = x0
        var a = floor(x)
        var (h1, k1, h, k) = (1, 0, Int(a), 1)
        
        while x - a > eps * Double(k) * Double(k) {
            x = 1.0/(x - a)
            a = floor(x)
            (h1, k1, h, k) = (h, k, h1 + Int(a) * h, k1 + Int(a) * k)
        }
        return (h, k)
    }
    func fractionMutableAttributedString(for string: String,  color:UIColor, size: CGFloat, weight: UIFont.Weight) -> NSAttributedString {
        
        let attributes: [NSAttributedString.Key: Any] = [.foregroundColor: color, .font: UIFont.systemFont(ofSize: size, weight: weight)]
        //let str = string.replacingOccurrences(of: " ", with: " ", options: .literal, range: string.range(of: " kg"))
        let attributedText = NSMutableAttributedString(string: string, attributes: attributes)
        
        let substring = string.split(separator: " ") // Do we have a fractional value?
        if substring[0].contains("/") {
            let range = (string as NSString).range(of: String(substring[0]))
            //let simpletext = attributedText.string.replacingOccurrences(of: " ", with: "")
            //attributedText = NSMutableAttributedString(string: simpletext, attributes: attributes )
            attributedText.addAttribute(NSAttributedString.Key.font, value: UIFont.fractionFont(ofSize: size,weight: weight), range: range)
        }
        else if substring[1].contains("/"){
            let range = (string as NSString).range(of: String(substring[1]))
            //let simpletext = attributedText.string.replacingOccurrences(of: " ", with: "")
            //attributedText = NSMutableAttributedString(string: simpletext, attributes: attributes )
            attributedText.addAttribute(NSAttributedString.Key.font, value: UIFont.fractionFont(ofSize: size,weight: weight), range: range)
        }
        
        
        return attributedText
        
    }
    func getDirectoryPath(isImage:Bool = false) -> String {
        
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        var documentsDirectory = paths[0] as String
        if isImage{
            
            documentsDirectory = (paths[0] as NSString).appendingPathComponent("Images") as String
            
            let fileManager = FileManager.default
            if fileManager.fileExists(atPath: documentsDirectory){
                return documentsDirectory
            }
            else{
                do{
                    try fileManager.createDirectory(atPath: documentsDirectory, withIntermediateDirectories: true, attributes: nil)
                    return documentsDirectory
                }
                catch{
                    print(error)
                    return ""
                }
            }
        }
        else{
            return documentsDirectory
        }
        
    }
}
