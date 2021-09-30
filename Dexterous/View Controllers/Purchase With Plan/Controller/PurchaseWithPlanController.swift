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
    
    override func viewWillAppear(_ animated: Bool) {
        self.freeTrailPopUp()
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
        cell.Benifit.text = "- Pages\n\n- UNLIMITED Revisions\n\n- UNLIMITED Designs\n\n- UNLIMITED Writing\n\n- WordPress\n\n- Mobile First Design"
        clearCellSelectionColor(cell: cell)
        return cell
        
    }
    
    func clearCellSelectionColor(cell:UITableViewCell) {
        let view = UIView()
        view.backgroundColor = .clear
        cell.selectedBackgroundView = view
    }
    
    
}
