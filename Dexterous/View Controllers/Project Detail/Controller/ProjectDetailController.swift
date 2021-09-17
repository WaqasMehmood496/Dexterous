//
//  ProjectDetailController.swift
//  Dexterous
//
//  Created by Buzzware Tech on 17/09/2021.
//

import UIKit

class ProjectDetailController: UIViewController {

    @IBOutlet weak var ProjectTitleTF: UITextField!
    @IBOutlet weak var ProjectDescriptionTV: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setPaddingOnFields(fields: [ProjectTitleTF])
        ProjectDescriptionTV.textColor = UIColor.lightGray
        ProjectDescriptionTV.delegate = self
    }
    @IBAction func InviteBtnAction(_ sender: UIButton) {
        
    }
    
}

extension ProjectDetailController: UITextViewDelegate {
    public func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor(named: "Black Text Color")
        }
    }
    public func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "Website development and SEO"
            textView.textColor = UIColor.lightGray
        }
    }
}
