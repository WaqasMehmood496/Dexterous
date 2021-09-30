//
//  TiervViewController.swift
//  Dexterous
//
//  Created by Macbook Air on 9/14/21.
//

import UIKit

class TiervViewController: UIViewController {
    
    //IBOUTLET'S
    @IBOutlet weak var tierTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.freeTrailPopUp()
    }
    
    //IBACTION'S
    @IBAction func tempBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func cancelbtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func donebtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}

//MARK:- UITABLEVIEW DELEGATE AND DATASOURCE METHOD'S
extension TiervViewController:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "TeirStartTableViewCell") as! TeirStartTableViewCell
            clearCellSelectionColor(cell: cell)
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "tierWebTableViewCell") as! tierWebTableViewCell
            clearCellSelectionColor(cell: cell)
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "tierwebdevelopTableViewCell") as! tierwebdevelopTableViewCell
            clearCellSelectionColor(cell: cell)
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "tiertfTableViewCell") as! tiertfTableViewCell
            clearCellSelectionColor(cell: cell)
            return cell
            
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "tieremptyTableViewCell") as! tieremptyTableViewCell
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
