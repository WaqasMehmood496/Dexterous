//
//  StartUpController.swift
//  Dexterous
//
//  Created by Buzzware Tech on 13/09/2021.
//

import UIKit

class StartUpController: UIViewController {
    
    @IBOutlet weak var StartUpPageControll: UIPageControl!
    @IBOutlet weak var CartoonImage: UIImageView!
    
    var counter = 0
    var totalPages = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSwapGestureOnCartoonImage()
    }
    @IBAction func SignInBtnAction(_ sender: Any) {
        self.performSegue(withIdentifier: "SignInSegue", sender: nil)
    }
    @IBAction func SignUpBtnAction(_ sender: Any) {
        self.performSegue(withIdentifier: "BusinessSignupSegue", sender: nil)
    }
    @IBAction func SkipNowBtnAction(_ sender: UIButton) {
        changeRootViewController(identifier: "TabbarController")
    }
    
    func addSwapGestureOnCartoonImage() {
        let letfswapGesture = UISwipeGestureRecognizer(target: self, action: #selector(cartoonImageSwapGesture(_:)))
        letfswapGesture.direction = .left
        CartoonImage.addGestureRecognizer(letfswapGesture)
        
        let rightswapGesture = UISwipeGestureRecognizer(target: self, action: #selector(cartoonImageSwapGesture(_:)))
        rightswapGesture.direction = .right
        CartoonImage.addGestureRecognizer(rightswapGesture)
        
        CartoonImage.isUserInteractionEnabled = true
    }
    
    @objc func cartoonImageSwapGesture (_ sender:UISwipeGestureRecognizer) {
        switch sender.direction {
        case .right:
            if counter > 0 {
                self.counter -= 1
                self.StartUpPageControll.currentPage = counter
            } else {
                self.counter = totalPages
                self.StartUpPageControll.currentPage = counter
            }
        case .left:
            if counter < totalPages {
                self.counter += 1
                self.StartUpPageControll.currentPage = counter
            } else {
                self.counter = 0
                self.StartUpPageControll.currentPage = counter
            }
        default:
            break
        }
    }
}

