//
//  WhyVideoViewController.swift
//  Dexterous
//
//  Created by Macbook Air on 9/16/21.
//

import UIKit

class WhyVideoViewController: UIViewController {
    
    //IBOUTLET'S
    @IBOutlet weak var whyTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
        self.tabBarController?.tabBar.isHidden = true
    }
    
    //IBACTION'S
    @IBAction func backbtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}

extension WhyVideoViewController:UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else if section == 1 {
            return 5
        } else if section == 2 {
            return 4
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Whyvideo1TableViewCell") as! Whyvideo1TableViewCell
            clearCellSelectionColor(cell: cell)
            return cell
        }
        else if indexPath.section == 1 {
            
            if indexPath.row == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "StartsHeader")!
                return cell
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "WhyVideo2TableViewCell", for: indexPath) as! WhyVideo2TableViewCell
                cell.lblName.text = "32% 'Lorem ispem is dummy text that is readable'-Source"
                clearCellSelectionColor(cell: cell)
                return cell
            }
        }
        else if indexPath.section == 2 {
            
            if indexPath.row == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "StartsHeader",for: indexPath)
                return cell
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "WhyVideo3TableViewCell") as! WhyVideo3TableViewCell
                cell.lblName.text = "You have a website"
                cell.imageicon.image = #imageLiteral(resourceName: "Vid")
                clearCellSelectionColor(cell: cell)
                return cell
            }
            
        }
        else {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "WhyVideo4TableViewCell") as! WhyVideo4TableViewCell
            clearCellSelectionColor(cell: cell)
            return cell
        }
    }
    
    func clearCellSelectionColor(cell:UITableViewCell) {
        let view = UIView()
        view.backgroundColor = .clear
        cell.selectedBackgroundView = view
    }
}
extension NSMutableAttributedString {
    
    func underline(term: String) {
        
        guard let underlineRange = string.range(of: term) else {
            
            return
        }
        
        let startPosition = string.distance(from: term.startIndex, to: underlineRange.lowerBound)
        let nsrange = NSRange(location: startPosition, length: term.count)
        
        addAttribute(
            .underlineStyle,
            value: NSUnderlineStyle.single.rawValue,
            range: nsrange)
    }
}
