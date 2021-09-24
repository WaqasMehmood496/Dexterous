//
//  PaymentController.swift
//  Dexterous
//
//  Created by Buzzware Tech on 16/09/2021.
//

import UIKit

class PaymentController: UIViewController {
    
    //IBOUTLETS
    @IBOutlet weak var PaymentTableView: UITableView!
    
    //VARIABLE'S
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //IBACTION'S
    @IBAction func BackBtnAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}


//MARK:- HELPING METHOD'S
extension PaymentController {
    func MoveToNextVC(identifier:String)  {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(identifier: identifier)
        self.navigationController?.pushViewController(controller, animated: true)
    }
}


//MARK:- UITABLEVIEW DELEGATE AND DATASOURCE METHOD'S
extension PaymentController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 2 || section == 3 {
            return 4
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            return userPalnCell(tableView: tableView, indexPath: indexPath)
        } else if indexPath.section == 1 {
            return invoiceTitleCell(tableView: tableView, indexPath: indexPath)
            
        }  else if indexPath.section == 2 {
            if indexPath.row == 0 {
                return currentInvoiceCell(tableView: tableView, indexPath: indexPath)
            } else {
                return invoiceCell(tableView: tableView, indexPath: indexPath)
            }
        } else {
            if indexPath.row == 0 {
                return previousInvoiceCell(tableView: tableView, indexPath: indexPath)
            } else {
                return invoiceCell(tableView: tableView, indexPath: indexPath)
            }
        }
    }
}


//MARK:- UITABLEVIEW HELPING METHODS AND OBSERVERS
extension PaymentController {
    
    func userPalnCell(tableView:UITableView,indexPath:IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserPlanTableViewCell", for: indexPath) as! UserPlanTableViewCell
        cell.ManageMyPaymentBtn.addTarget(self, action: #selector(ManageMyPaymentBtnAction(_:)), for: .touchUpInside)
        cell.AddUserBtn.addTarget(self, action: #selector(AddUserBtnAction(_:)), for: .touchUpInside)
        cell.UpgradeMyPlanBtn.addTarget(self, action: #selector(UpgradedMyPlanBtnAction(_:)), for: .touchUpInside)
        cell.SeePreviousInvoicesBtn.addTarget(self, action: #selector(SeePreviousInvoicesBtnAction(_:)), for: .touchUpInside)
        cell.SareDexterousAppBtn.addTarget(self, action: #selector(ShareDexterousBtnAction(_:)), for: .touchUpInside)
        cell.AddMarketingBtn.addTarget(self, action: #selector(AddMarketingBtnAction(_:)), for: .touchUpInside)
        cell.LearnMoreBtn.addTarget(self, action: #selector(LearnMoreBtnAction(_:)), for: .touchUpInside)
        boldLabeInitialText(boldText: "$0.00", normalText: " Your all set. No Payment due", label: cell.PriceDescriptionLabel)
        clearCellSelectionColor(cell: cell)
        return cell
        
    }
    
    func invoiceTitleCell(tableView:UITableView,indexPath:IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "InvoicesHeaderCell", for: indexPath)
        clearCellSelectionColor(cell: cell)
        return cell
        
    }
    
    func currentInvoiceCell(tableView:UITableView,indexPath:IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CurrentInvoiceCell", for: indexPath)
        clearCellSelectionColor(cell: cell)
        return cell
    }
    
    func invoiceCell(tableView:UITableView,indexPath:IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "InvoicesTableViewCell", for: indexPath) as! InvoicesTableViewCell
        clearCellSelectionColor(cell: cell)
        return cell    }
    
    func previousInvoiceCell(tableView:UITableView,indexPath:IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PreviousInvoicesCell", for: indexPath)
        clearCellSelectionColor(cell: cell)
        return cell
    }
    
    func boldLabeInitialText(boldText:String, normalText:String, label:UILabel) {
        
        let attributedString = NSMutableAttributedString(string:normalText)
        let attrs = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 12)]
        let boldString = NSMutableAttributedString(string: boldText, attributes:attrs)
        boldString.append(attributedString)
        label.attributedText = boldString
    }
    
    func clearCellSelectionColor(cell:UITableViewCell) {
        let view = UIView()
        view.backgroundColor = .clear
        cell.selectedBackgroundView = view
    }
    
    
    //MARK: OBSERVER'S
    @objc func ManageMyPaymentBtnAction (_ sender:UIButton) {
        
    }
    @objc func AddUserBtnAction (_ sender:UIButton) {
        MoveToNextVC(identifier: "WhichTeamViewController")
    }
    @objc func UpgradedMyPlanBtnAction (_ sender:UIButton) {
        MoveToNextVC(identifier: "PurchaseWithPlanController")
    }
    @objc func SeePreviousInvoicesBtnAction (_ sender:UIButton) {
        
    }
    @objc func ShareDexterousBtnAction (_ sender:UIButton) {
        
    }
    @objc func AddMarketingBtnAction (_ sender:UIButton) {
        MoveToNextVC(identifier: "WorkRequestViewController")
    }
    
    @objc func LearnMoreBtnAction (_ sender:UIButton) {
        
    }
    
    
}
