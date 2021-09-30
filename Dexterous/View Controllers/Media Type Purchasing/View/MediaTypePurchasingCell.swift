//
//  MediaTypePurchasingCell.swift
//  Dexterous
//
//  Created by Buzzware Tech on 15/09/2021.
//

import UIKit

class MediaTypePurchasingCell: UITableViewCell {
    
    //IBOUTLET'S
    @IBOutlet weak var PlanPriceLabel: UILabel!
    @IBOutlet weak var PurchaseWithPlanBtn: UIButton!
    @IBOutlet weak var PurchaseBtn: UIButton!
    @IBOutlet weak var BenifitsTableView: UITableView!
    
    //VARIABLE'S
    var benifits = [String]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        BenifitsTableView.delegate = self
        BenifitsTableView.dataSource = self
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}

extension MediaTypePurchasingCell: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return benifits.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MediaTypeBenifitsTableViewCell", for: indexPath) as! MediaTypeBenifitsTableViewCell
        cell.BenifitLabel.text = benifits[indexPath.row]
        clearCellSelectionColor(cell: cell)
        return cell
    }
    
    func clearCellSelectionColor(cell:UITableViewCell) {
        let view = UIView()
        view.backgroundColor = .clear
        cell.selectedBackgroundView = view
    }
    
}
