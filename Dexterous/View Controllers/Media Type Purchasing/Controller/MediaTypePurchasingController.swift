//
//  MediaTypePurchasingController.swift
//  Dexterous
//
//  Created by Buzzware Tech on 15/09/2021.
//

import UIKit

class MediaTypePurchasingController: UIViewController {
    
    //IBOUTLETS
    @IBOutlet weak var ProductLogo: UIImageView!
    @IBOutlet weak var PurchasingTableView: UITableView!
    
    //VARIABLE'S
    var product = ProductModel()
    private let spacingIphone:CGFloat = 15.0
    private let spacingIpad:CGFloat = 30.0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.ProductLogo.image = UIImage(named: product.mediaLogo)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.freeTrailPopUp()
    }
    
    @IBAction func BackBtnAction(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
        self.dismiss(animated: true, completion: nil)
    }
    
}


//MARK: - HELPIG METHOD'S
extension MediaTypePurchasingController {
    
    func MoveToNextVC(identifier:String)  {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(identifier: identifier)
        self.navigationController?.pushViewController(controller, animated: true)
    }
}

//MARK: - UITABLEVIEW DELEGATE AND DATASOURCE METHOD'S
extension MediaTypePurchasingController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return product.produtsTypes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MediaPurchasingCell", for: indexPath) as! MediaTypePurchasingCell
        clearCellSelectionColor(cell: cell)
        //Add tags on buttons
        cell.PurchaseBtn.tag = indexPath.row
        cell.PurchaseWithPlanBtn.tag = indexPath.row
        // Change buttons title, background, Border color
        cell.PurchaseWithPlanBtn.setTitleColor(UIColor(named: self.product.mediaColor), for: .normal)
        cell.PurchaseWithPlanBtn.borderColor = UIColor(named: self.product.mediaColor)
        cell.PurchaseBtn.backgroundColor = UIColor(named: self.product.mediaColor)
        //Add Targets on buttons
        cell.PurchaseBtn.addTarget(self, action: #selector(PaymentBtnAction(_:)), for: .touchUpInside)
        cell.PurchaseWithPlanBtn.addTarget(self, action: #selector(PurchaseWithPlanBtnAction(_:)), for: .touchUpInside)
        //Assign benifits to tableview.
        cell.benifits = self.product.produtsTypes[indexPath.row].benifit
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        //        let cell = PurchasingTableView.cellForRow(at: indexPath) as! MediaTypePurchasingCell
        //        let contentSize = cell.BenifitsTableView.contentSize.height + 54.5
        return UITableView.automaticDimension
    }
    
    @objc func PaymentBtnAction (_ sender:UIButton) {
        MoveToNextVC(identifier: "CardPaymentController")
    }
    
    @objc func PurchaseWithPlanBtnAction (_ sender:UIButton) {
        MoveToNextVC(identifier: "MemberShipController")
    }
    
    func clearCellSelectionColor(cell:UITableViewCell) {
        let view = UIView()
        view.backgroundColor = .clear
        cell.selectedBackgroundView = view
    }
}
