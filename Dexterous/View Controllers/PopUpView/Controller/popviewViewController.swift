//
//  popviewViewController.swift
//  Dexterous
//
//  Created by Macbook Air on 9/14/21.
//

import UIKit

class popviewViewController: UIViewController {

    @IBOutlet weak var tableviewHeight: NSLayoutConstraint!
    @IBOutlet weak var poptableview: UITableView!
    var delegate = MyTasksViewController()
    var delegate2 = MessageViewController()

    
    var isredirectFrom = ""
    var array = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        poptableview.transform = CGAffineTransform(rotationAngle: -(CGFloat)(Double.pi));
        array.reverse()
       // scrollToFirstRow()
        poptableview.showsVerticalScrollIndicator = false
       // poptableview.setContentOffset(.zero, animated: true)


        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillLayoutSubviews() {
        super.updateViewConstraints()
        self.tableviewHeight.constant = self.poptableview.contentSize.height
    }
    

}
extension popviewViewController:UITableViewDelegate,UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
        if array[indexPath.row] == "Cancel"{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "popCancelbtnTableViewCell") as! popCancelbtnTableViewCell
            cell.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi));
            cell.lblcancle.text = array[indexPath.row]
            
            return cell
        }
        
        else{
          
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "popOptionTableViewCell") as! popOptionTableViewCell
            cell.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi));

            cell.lbloption.text = array[indexPath.row]
            return cell
        }
        
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        self.viewWillLayoutSubviews()
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        if isredirectFrom == "TASK"{
            
            switch array[indexPath.row] {
            case "Cancel":
                
                self.dismiss(animated: true) {
                }
           
                

            case "Share":
                self.dismiss(animated: true) {
                }


            case "New Project":
                
                self.dismiss(animated: true) {
                    self.delegate.newTask()
                }

                    
            case "Add Task":
                self.dismiss(animated: true) {
                    self.delegate.newTask()
                }

                
            default:
                return
            }
        }
        else if isredirectFrom == "CHAT"{
            
            
            if array[indexPath.row] == "Add Team"{
                
                self.dismiss(animated: true) {
                    self.delegate2.gotoNext()
                }
            }
            
           else if array[indexPath.row] == "Cancel"{
                self.dismiss(animated: true, completion: nil)
            }
            
            
        }
        else{
            
            if array[indexPath.row] == "Cancel"{
                self.dismiss(animated: true, completion: nil)
            }
        }
        
      
        
    }
    
    
}
