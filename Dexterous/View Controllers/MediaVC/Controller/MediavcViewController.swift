//
//  MediavcViewController.swift
//  Dexterous
//
//  Created by Macbook Air on 9/15/21.
//
struct MediaStruct {
    var name:String!
    var isImage:Bool!
}
import UIKit

class MediavcViewController: UIViewController {

    @IBOutlet weak var mediaTableView: UITableView!
    
    //VARIABLE'S
    var array = [MediaStruct]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        array.append(MediaStruct(name: "POPULAR", isImage: false))
        array.append(MediaStruct(name: "RECENT", isImage: false))
        array.append(MediaStruct(name: "RECENT", isImage: true))
        array.append(MediaStruct(name: "RECENT", isImage: false))
        array.append(MediaStruct(name: "RECENT", isImage: false))
        array.append(MediaStruct(name: "RECENT", isImage: false))
        array.append(MediaStruct(name: "RECENT", isImage: false))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.freeTrailPopUp()
    }
    
    @IBAction func addbtn(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "popviewViewController") as! popviewViewController
        //controller.delegate = self
        controller.array = ["New Folder","Take Photo or Video","Scan Document","Choose From Library","Create New Note","Cancel"]
        controller.isredirectFrom = "MEDIA"
        self.parent?.tabBarController?.present(controller, animated: true, completion: nil)
    }
    
}
extension MediavcViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "Media1TableViewCell") as! Media1TableViewCell
            cell.imageTop.isHidden = true
            cell.lblTop.text = array[indexPath.row].name!
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "Media1TableViewCell") as! Media1TableViewCell
            cell.imageTop.isHidden = true
            cell.lblTop.text = array[indexPath.row].name!
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "Media1TableViewCell") as! Media1TableViewCell
            cell.lblTop.isHidden = true
            cell.imageTop.isHidden = false
            return cell
        case 3:
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "Media2TableViewCell") as! Media2TableViewCell
           
            return cell
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: "Media3TableViewCell") as! Media3TableViewCell
            cell.lblmedia2.attributedText = NSAttributedString(string: "Text", attributes:
                                                                [.underlineStyle: NSUnderlineStyle.single.rawValue])
            
            cell.lblmedia2.text = "Create Video"
            cell.lblmedia2.textColor = UIColor(named: "Green")
            return cell
        case 5:
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "Media4TableViewCell") as! Media4TableViewCell
            cell.lbl1media4.attributedText = NSAttributedString(string: "Text", attributes:
                                                                [.underlineStyle: NSUnderlineStyle.single.rawValue])
            cell.lbl2media4.attributedText = NSAttributedString(string: "Text", attributes:
                                                                [.underlineStyle: NSUnderlineStyle.single.rawValue])
            
            cell.lbl1media4.text = "Add Automation"
            cell.lbl1media4.textColor = UIColor(named: "Purple")
            
            cell.lbl2media4.text = "Add a Live Stream"
            cell.lbl2media4.textColor = UIColor(named: "Gray")
            
            return cell
            
        case 6:
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "media5TableViewCell") as! media5TableViewCell
        
            return cell
            
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    
    
    
    
}
