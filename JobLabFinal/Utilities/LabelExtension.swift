//
//  LabelExtension.swift
//  JobLabFinal
//
//  Created by Natia's Mac on 02.09.22.
//

import Foundation
import UIKit
extension UILabel {
    func addRequiredAsterisk(text: String)  {
        let text = text
        let range = (text as NSString).range(of: "*")
            let attributedString = NSMutableAttributedString(string:text)
        attributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.red.cgColor, range: range)
        self.attributedText = attributedString
    }
}
