//
//  TextFieldExtension.swift
//  JobLabFinal
//
//  Created by Natia's Mac on 02.09.22.
//

import Foundation
import UIKit

extension UITextField {
    func format() {
        self.keyboardType = UIKeyboardType.default
        self.returnKeyType = UIReturnKeyType.done
        self.autocorrectionType = UITextAutocorrectionType.no
        self.heightAnchor.constraint(equalToConstant: 43).isActive = true
        self.clearButtonMode = UITextField.ViewMode.whileEditing;
        self.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        self.layer.borderWidth = 1
        self.layer.borderColor = hexStringToUIColor(hex: "#D4EBFF").cgColor
        self.backgroundColor = .white
        self.layer.cornerRadius = 18
    }
    
    func shadowedField(){
        
         self.layer.shadowColor = hexStringToUIColor(hex: "#E8EBFF").cgColor
        self.layer.shadowRadius = 9
        self.layer.shadowOpacity = 0.6
        self.layer.shadowOffset = CGSize(width: 15,
                                             height: 15)
       // self.layer.masksToBounds = true
        
    }
    func addPaddingToTextField() {
        let paddingView: UIView = UIView.init(frame: CGRect(x: 0, y: 0, width: 8, height: 20))
        self.leftView = paddingView;
        self.leftViewMode = .always;
        self.rightView = paddingView;
        self.rightViewMode = .always;

    
        self.backgroundColor = .white
        self.textColor = .black
    }


}

extension UIView {
    func shadowedtoView(){
        
        self.layer.shadowColor = UIColor.blue.cgColor
        self.layer.shadowRadius = 5
        self.layer.shadowOpacity = 0.6
        self.layer.shadowOffset = CGSize(width: 20,
                                             height: 20)
       // self.layer.masksToBounds = true
        
    }
}
