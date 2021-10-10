//
//  ComponyLogosController.swift
//  Dexterous
//
//  Created by Mac on 01/10/2021.
//

import UIKit

class ComponyLogosController: UIViewController {
    
    //IBOUTLET'S
    @IBOutlet weak var LogoCollectionVIew: UICollectionView!
    
    //CONSTANT'S
    private let spacingIphone:CGFloat = 15.0
    private let spacingIpad:CGFloat = 30.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //IBACTION'S
    @IBAction func CancelBtnAction(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    @IBAction func DismisControllerAction(_ sender: UITapGestureRecognizer) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func AddAccount(_ sender: UIButton) {
        MoveToNextVC(identifier: "StartUpController")
        
    }
    
}

//MARK: - HELPING METHOD'S
extension ComponyLogosController {
    func MoveToNextVC(identifier:String)  {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(identifier: identifier)
        //self.navigationController?.pushViewController(controller, animated: false)
        self.dismiss(animated: true) {
            self.changeRootViewController(identifier: identifier)
        }
    }
}


//MARK: - UICOLLECTION VIEW DELEGATES AND DATA SOURCE METHOD'S
extension ComponyLogosController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ComponyLogoCell", for: indexPath) as! ComponyLogoCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.dismiss(animated: true) {
            //Call the delegate Methods to change the logo on dashboard.
        }
    }
}
