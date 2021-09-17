//
//  MediaTypePurchasingController.swift
//  Dexterous
//
//  Created by Buzzware Tech on 15/09/2021.
//

import UIKit

class MediaTypePurchasingController: UIViewController {

    @IBOutlet weak var PurchasingTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func BackBtnAction(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func MoveToNextVC(identifier:String)  {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(identifier: identifier)
        self.navigationController?.pushViewController(controller, animated: true)
    }
}

extension MediaTypePurchasingController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MediaPurchasingCell", for: indexPath) as! MediaTypePurchasingCell
        clearCellSelectionColor(cell: cell)
        cell.PurchaseBtn.tag = indexPath.row
        cell.PurchaseWithPlanBtn.tag = indexPath.row
        cell.PurchaseBtn.addTarget(self, action: #selector(PaymentBtnAction(_:)), for: .touchUpInside)
        cell.PurchaseWithPlanBtn.addTarget(self, action: #selector(PurchaseWithPlanBtnAction(_:)), for: .touchUpInside)
        return cell
    }
    
    @objc func PaymentBtnAction (_ sender:UIButton) {
        MoveToNextVC(identifier: "PaymentController")
    }
    
    @objc func PurchaseWithPlanBtnAction (_ sender:UIButton) {
        MoveToNextVC(identifier: "PurchaseWithPlanController")
    }
    
    
    
    func clearCellSelectionColor(cell:UITableViewCell) {
        let view = UIView()
        view.backgroundColor = .clear
        cell.selectedBackgroundView = view
    }
    
}
