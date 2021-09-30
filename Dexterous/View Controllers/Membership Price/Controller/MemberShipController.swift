//
//  MemberShipController.swift
//  Dexterous
//
//  Created by Mac on 29/09/2021.
//

import UIKit

class MemberShipController: UIViewController {
    
    //CONTANTS
    
    let membershipPriceArrray = [
        MembershipPriceModel(title: "Start Up", price: "$1500", description: "I am sole proprietor or a solely owned small business looking to jumpstart my business plan. I am looking for a markeeting partnership that can grow with my business.",color: "Pink"),
        MembershipPriceModel(title: "Entrepreneur", price: "$2500", description: "I am sole proprietor or a solely owned small business looking to jumpstart my business plan. I am looking for a markeeting partnership that can grow with my business.",color: "Color"),
        MembershipPriceModel(title: "Enterprise", price: "$5000", description: "I am sole proprietor or a solely owned small business looking to jumpstart my business plan. I am looking for a markeeting partnership that can grow with my business.",color: "Green"),
        MembershipPriceModel(title: "Premier", price: "Custom", description: "I am sole proprietor or a solely owned small business looking to jumpstart my business plan. I am looking for a markeeting partnership that can grow with my business.",color: "Purple")
    ]
    
    //VARIABLES
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

}


//MARK:- TYPES TABLEVIEW DELEGATE AND DATASOURCE
extension MemberShipController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return membershipPriceArrray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TypesTableViewCell", for: indexPath) as! TypesTableViewCell
        cell.TitleLabel.text = membershipPriceArrray[indexPath.row].title
        cell.DetailLabel.text = membershipPriceArrray[indexPath.row].description
        
        cell.PriceLabel.text = membershipPriceArrray[indexPath.row].price
        cell.PriceLabel.textColor = UIColor(named: membershipPriceArrray[indexPath.row].color)
        
        cell.backView.borderColor = UIColor(named: membershipPriceArrray[indexPath.row].color)
        
        cell.PricePeriod.textColor = UIColor(named: membershipPriceArrray[indexPath.row].color)
        
        if indexPath.row == membershipPriceArrray.count - 1 {
            cell.PricePeriod.text = ""
        }
        
        let selecedView = UIView()
        selecedView.backgroundColor = .clear
        cell.selectedBackgroundView = selecedView
        
        return cell
    }
}
