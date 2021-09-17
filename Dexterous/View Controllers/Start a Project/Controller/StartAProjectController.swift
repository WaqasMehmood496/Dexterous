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
        clearCellSelectionColor(cell: cell)
        return cell
    }
    
    func clearCellSelectionColor(cell:UITableViewCell) {
        let view = UIView()
        view.backgroundColor = .clear
        cell.selectedBackgroundView = view
    }
}
