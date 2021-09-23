//
//  StartAProjectController.swift
//  Dexterous
//
//  Created by Buzzware Tech on 17/09/2021.
//

import UIKit

class StartAProjectController: UIViewController {
    
    //IBOUTLET'S
    @IBOutlet weak var ProjectFeaturesTableView: UITableView!
    @IBOutlet weak var ProjectDescriptionLabel: UILabel!
    @IBOutlet weak var ProjectNameTF: UITextField!
    
    //VARIABLES
    var isFirstSelected = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setPaddingOnFields(fields: [ProjectNameTF])
    }
    @IBAction func BackBtnAction(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func NextBtnAction(_ sender: UIButton) {
        MoveToNextVC(identifier: "ProjectDetailController")
    }
}

extension StartAProjectController {
    func MoveToNextVC(identifier:String)  {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(identifier: identifier)
        self.navigationController?.pushViewController(controller, animated: true)
    }
}

extension StartAProjectController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProjectFeaturesTableViewCell", for: indexPath) as! ProjectFeaturesTableViewCell
        
        if indexPath.row == 0 {
            cell.BackView.borderColor = UIColor(named: "App Background Theam")
            cell.CheckMarkBtn.setImage(UIImage(named: "Icon awesome-check"), for: .normal)
            cell.CheckMarkBtn.borderColor = UIColor(named: "App Background Theam")
            cell.CheckMarkBtn.backgroundColor = UIColor(named: "App Background Theam")
        } else {
            cell.BackView.borderColor = UIColor(named: "Gray")
            cell.CheckMarkBtn.setImage(UIImage(named: ""), for: .normal)
            cell.CheckMarkBtn.borderColor = UIColor(named: "Gray")
            cell.CheckMarkBtn.backgroundColor = .clear
        }
        cell.CheckMarkBtn.tag = indexPath.row
        cell.CheckMarkBtn.addTarget(self, action: #selector(CheckMarkBtnAction(_:)), for: .touchUpInside)
        clearCellSelectionColor(cell: cell)
        return cell
    }
    
    @objc func CheckMarkBtnAction (_ sender:UIButton) {
        let indexPath = IndexPath(row: sender.tag, section: 0)
        if indexPath.row == 0 {
            let cell = self.ProjectFeaturesTableView.cellForRow(at: indexPath) as! ProjectFeaturesTableViewCell
            
            if isFirstSelected {
                isFirstSelected = !isFirstSelected
                cell.BackView.borderColor = UIColor(named: "Gray")
                cell.CheckMarkBtn.setImage(UIImage(named: ""), for: .normal)
                cell.CheckMarkBtn.borderColor = UIColor(named: "Gray")
                cell.CheckMarkBtn.backgroundColor = .clear
            } else {
                isFirstSelected = !isFirstSelected
                cell.BackView.borderColor = UIColor(named: "App Background Theam")
                cell.CheckMarkBtn.setImage(UIImage(named: "Icon awesome-check"), for: .normal)
                cell.CheckMarkBtn.borderColor = UIColor(named: "App Background Theam")
                cell.CheckMarkBtn.backgroundColor = UIColor(named: "App Background Theam")
            }
        }
    }
    
    func clearCellSelectionColor(cell:UITableViewCell) {
        let view = UIView()
        view.backgroundColor = .clear
        cell.selectedBackgroundView = view
    }
    
}
