//
//  UILabel_Additions.swift
//  Dexterous
//
//  Created by Mac on 02/10/2021.
//

import Foundation
import UIKit

extension UILabel {
    
    func setMargins(margin: CGFloat = 1.0) {
        if let textString = self.text {
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.firstLineHeadIndent = margin
            paragraphStyle.headIndent = margin
            paragraphStyle.tailIndent = -margin
            let attributedString = NSMutableAttributedString(string: textString)
            attributedString.addAttribute(.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: attributedString.length))
            attributedText = attributedString
        }
    }
}

