//
//  popSignupViewController.swift
//  Dexterous
//
//  Created by Macbook Air on 9/17/21.
//

import UIKit

class popSignupViewController: UIViewController {
    
    //IBOUTLET'S
    @IBOutlet weak var lblpopUp: UILabel!
    
    //CONSTANT'S
    var lblText:String!
    var isWebsite = false
    //VARIABLE'S
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.lblpopUp.text = lblText
    }
    
    @IBAction func yesbtn(_ sender: Any) {
        let controller = getViewController(identifier: "MediaTypePurchasingController") as! MediaTypePurchasingController
        controller.product = assignDataToProducts()
        self.present(controller, animated: true, completion: nil)
    }
    
    @IBAction func notbtn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func DismisViewControllerTapGesture(_ sender: UITapGestureRecognizer) {
        self.dismiss(animated: true, completion: nil)
    }
    
}


//MARK: - HELPING METHOD'S
extension popSignupViewController {
    func assignDataToProducts() ->  ProductModel{
        return ProductModel(
            mediaType: ProductsTypes.website.rawValue,
            mediaLogo: ProductsLogo.website.rawValue,
            mediaColor: ProductsColor.website.rawValue,
            produtsTypes: [
                ProductTypesModel(title: "Monthly Blog Service", price: "$125", benifit: [
                    "1 Blog per month",
                    "500 Words",
                    "Image Included",
                    "Written for a specific SEO keyword"
                ])
            ]
        )
    }
}
