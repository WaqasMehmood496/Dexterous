//
//  PurchaseWithPlanController.swift
//  Dexterous
//
//  Created by Buzzware Tech on 16/09/2021.
//

import UIKit

class PurchaseWithPlanController: UIViewController {
    
    @IBOutlet weak var PlanTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()        
    }
    
    @IBAction func BackBtnAction(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
}

extension PurchaseWithPlanController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BasicPlanTableViewCell", for: indexPath) as! BasicPlanTableViewCell
        cell.Benifit.text = "- Pages\n\n- UNLIMITED Revisions"
        clearCellSelectionColor(cell: cell)
        return cell
        
    }
    
    func clearCellSelectionColor(cell:UITableViewCell) {
        let view = UIView()
        view.backgroundColor = .clear
        cell.selectedBackgroundView = view
    }
    
    
}
