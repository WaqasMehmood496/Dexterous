//
//  WhyVideoViewController.swift
//  Dexterous
//
//  Created by Macbook Air on 9/16/21.
//
struct WhyvideoSection {
    var name:String!
    var array:[WhyvideoData]!
}
struct WhyvideoData {
    
    var name:String!
    var image:UIImage!
    var color:UIColor!
    
}

import UIKit

class WhyVideoViewController: UIViewController {
    
    @IBOutlet weak var whyTableView: UITableView!
    
    var array = [WhyvideoSection]()
    var dataarray1 = [WhyvideoData]()
    var dataarray2 = [WhyvideoData]()
    var dataarray3 = [WhyvideoData]()
    var dataarray4 = [WhyvideoData]()



    override func viewDidLoad() {
        super.viewDidLoad()

        self.dataarray1.append(WhyvideoData(name: "Why Should be my next step?", image: nil, color: nil))
        self.array.append(WhyvideoSection(name: "Why Should be my next step?", array: self.dataarray1))
        
        let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: "'Lorem ispem is dummy text that is readable'")
        attributeString.addAttribute(NSAttributedString.Key.underlineStyle, value: 1, range: NSMakeRange(0, attributeString.length))
        
        self.dataarray2.append(WhyvideoData(name: "32% 'Lorem ispem is dummy text that is readable'-Source", image: nil, color: nil))
        self.dataarray2.append(WhyvideoData(name: "00% 'Lorem ispem is dummy text that is readable'-Source", image: nil, color: nil))
        self.dataarray2.append(WhyvideoData(name: "99% 'Lorem ispem is dummy text that is readable'-Source", image: nil, color: nil))
        self.dataarray2.append(WhyvideoData(name: "99.9% 'Lorem ispem is dummy text that is readable'-Source", image: nil, color: nil))
        self.array.append(WhyvideoSection(name: "Stats", array: self.dataarray2))
        
        
        
        self.dataarray3.append(WhyvideoData(name: "You hava a website", image: #imageLiteral(resourceName: "Web"), color: nil))
        self.dataarray3.append(WhyvideoData(name: "You hava search..", image: #imageLiteral(resourceName: "Seo"), color: nil))
        self.dataarray3.append(WhyvideoData(name: "Video build upon seo and web.Lorem ispem is dummy text that is readable,Lorem ispem is dummy text that is readable,Lorem ispem is dummy text that is readable", image: #imageLiteral(resourceName: "Vid"), color: nil))
        self.array.append(WhyvideoSection(name: "Company Journey", array: self.dataarray3))

        
        self.dataarray4.append(WhyvideoData(name: "ORDER VIDEO NOW", image: nil, color: UIColor(named: "App Background Theam")))
        self.dataarray4.append(WhyvideoData(name: "TALK TO MY SPECIALIST ABOUT VIDEO", image: nil, color: UIColor(named: "App Background Theam")))
        
        self.array.append(WhyvideoSection(name: "button", array: self.dataarray4))
        

        
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.navigationController?.navigationBar.isHidden = true
        self.tabBarController?.tabBar.isHidden = true

    }

    
    @IBAction func backbtn(_ sender: Any) {
        
    }
    
    
    
    
    
}
extension WhyVideoViewController:UITableViewDelegate,UITableViewDataSource{
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
      
        return array.count
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        
        
        let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 40))
        headerView.backgroundColor = UIColor.clear
        let label = UILabel()
        label.frame = CGRect.init(x: 24, y: 12,width: headerView.frame.width-10, height: headerView.frame.height-20)

        label.text = array[section].name
        label.font = UIFont.boldSystemFont(ofSize: 12.0)

       // label.font = UIFont(name: "System", size: 12)
        label.textColor = UIColor.black
        headerView.addSubview(label)
        
        return headerView
        
          
        
        
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        
        if array[section].name == "button"{
            return 0.0
        }
        else{
            return 40.0
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array[section].array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if array[indexPath.section].name == "Why Should be my next step?"{
            let cell = tableView.dequeueReusableCell(withIdentifier: "Whyvideo1TableViewCell") as! Whyvideo1TableViewCell
            return cell
        }
        else if array[indexPath.section].name == "Stats" {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "WhyVideo2TableViewCell") as! WhyVideo2TableViewCell
   
            cell.lblName.text = array[indexPath.section].array[indexPath.row].name!
            
            return cell
        }
        else if array[indexPath.section].name == "Company Journey"{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "WhyVideo3TableViewCell") as! WhyVideo3TableViewCell
            
            cell.lblName.text = array[indexPath.section].array[indexPath.row].name!
            cell.imageicon.image = array[indexPath.section].array[indexPath.row].image!
            
            return cell
        }
        else if array[indexPath.section].name == "button"{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "WhyVideo4TableViewCell") as! WhyVideo4TableViewCell
            
            if array[indexPath.section].array[indexPath.row].name == "ORDER VIDEO NOW" {
                
                cell.cellBtn.backgroundColor = array[indexPath.section].array[indexPath.row].color!
                cell.cellBtn.setTitle(array[indexPath.section].array[indexPath.row].name!, for: .normal)
                cell.cellBtn.setTitleColor(.white, for: .normal)
                
            }
            else{
                
                cell.cellBtn.backgroundColor = .clear
                cell.cellBtn.layer.borderWidth = 1
                cell.cellBtn.layer.borderColor =  array[indexPath.section].array[indexPath.row].color!.cgColor

                cell.cellBtn.setTitle(array[indexPath.section].array[indexPath.row].name!, for: .normal)
                cell.cellBtn.setTitleColor(array[indexPath.section].array[indexPath.row].color!, for: .normal)

            }
            
            return cell
        }
        else{
            return UITableViewCell()
        }
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
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
