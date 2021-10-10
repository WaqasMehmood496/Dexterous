//
//  AllTemplatesController.swift
//  Dexterous
//
//  Created by Mac on 08/10/2021.
//

import UIKit

class AllTemplatesController: UIViewController {
    
    //IBOUTLET'S
    @IBOutlet weak var AllTempletesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func BackBtnAction(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}


//MARK: - HELPING METHODS
extension AllTemplatesController {
    func MoveToNextVC(identifier:String)  {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(identifier: identifier)
        self.navigationController?.pushViewController(controller, animated: true)
    }
}


//MARK: - UITABLEVIEW DELEGATE AND DATASOURCE
extension AllTemplatesController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TemplatesCell", for: indexPath) as! TemplatesCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.MoveToNextVC(identifier: "TiervViewController")
    }
    
}
