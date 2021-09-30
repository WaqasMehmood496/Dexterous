//
//  EditTeamViewController.swift
//  Dexterous
//
//  Created by Macbook Air on 9/15/21.
//

struct TeamStruct{
    var name:String!
    var BtnName:String!
    var color:String!
    var images:[UIImage]!
}

import UIKit

class EditTeamViewController: UIViewController {

    @IBOutlet weak var editTeamTableView: UITableView!
    
    var array = [TeamStruct]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        editTeamTableView.showsVerticalScrollIndicator = false

        self.array.append(TeamStruct(name: "ADMIN", BtnName: "", color: "App Background Theam", images: [#imageLiteral(resourceName: "Mask Group 374"),#imageLiteral(resourceName: "Ellipse 1")]))
        self.array.append(TeamStruct(name: "WEB TEAM", BtnName: "", color: "Orange", images: [#imageLiteral(resourceName: "Mask Group 374"),#imageLiteral(resourceName: "Mask Group 373"),#imageLiteral(resourceName: "Ellipse 1")]))
        self.array.append(TeamStruct(name: "SEO TEAM", BtnName: "", color: "Purple", images: [#imageLiteral(resourceName: "Mask Group 374")]))
        self.array.append(TeamStruct(name: "VIDEO TEAM", BtnName: "", color: "Green", images: [#imageLiteral(resourceName: "Mask Group 374"),#imageLiteral(resourceName: "Mask Group 374"),#imageLiteral(resourceName: "Mask Group 373"),#imageLiteral(resourceName: "Ellipse 1"),#imageLiteral(resourceName: "Mask Group 374"),#imageLiteral(resourceName: "Mask Group 373"),#imageLiteral(resourceName: "Ellipse 1"),#imageLiteral(resourceName: "Mask Group 374"),#imageLiteral(resourceName: "Mask Group 373"),#imageLiteral(resourceName: "Ellipse 1")]))
        self.array.append(TeamStruct(name: "CUSTOM TEAM", BtnName: "", color: "App Background Theam", images: [#imageLiteral(resourceName: "Mask Group 374")]))
        
        self.array.append(TeamStruct(name: "button", BtnName: "", color: "App Background Theam", images: [#imageLiteral(resourceName: "Mask Group 374")]))
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.freeTrailPopUp()
    }
    
    @IBAction func backbtn(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
    


}
extension EditTeamViewController:UITableViewDelegate,UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if array[indexPath.row].name != "button"{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "AddTeam1TableViewCell") as! AddTeam1TableViewCell
            cell.buttonTeam.layer.borderWidth = 1
            cell.buttonTeam.layer.borderColor = UIColor(named: array[indexPath.row].color!)?.cgColor
            cell.buttonTeam.setTitle("ADD TO TEAM", for: .normal)
            cell.buttonTeam.setTitleColor(UIColor(named: array[indexPath.row].color!), for: .normal)
            cell.maintext.text = array[indexPath.row].name!
            cell.maintext.textColor = UIColor(named: array[indexPath.row].color!)
            cell.collectionviewCell.delegate = self
            cell.collectionviewCell.dataSource  = self
            cell.collectionviewCell.tag = indexPath.row
            cell.collectionviewCell.showsHorizontalScrollIndicator = false
            cell.collectionviewCell.reloadData()
            
            return cell

        }
        else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "AddTeam2TableViewCell") as! AddTeam2TableViewCell
            return cell
        }
    }
    
    
    
    
}
extension EditTeamViewController:UICollectionViewDataSource,UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return array[collectionView.tag].images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "addTeamCollectionViewCell", for: indexPath) as! addTeamCollectionViewCell
        cell.imageTeam.image = self.array[collectionView.tag].images[indexPath.row]
        cell.btnteam.addTarget(self, action: #selector(gotopop), for: .touchUpInside)
        return cell
    }
    @objc func gotopop(){
        print("Some")
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "popedituserViewController") as! popedituserViewController
        //controller.delegate = self
       // controller.lblText = "Would you like to create a website?"
        self.parent?.tabBarController?.present(controller, animated: true, completion: nil)
        
    }
}

