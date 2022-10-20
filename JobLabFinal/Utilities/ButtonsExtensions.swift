//
//  AddMediaButtons.swift
//  JobLabFinal
//
//  Created by Natia's Mac on 03.09.22.
//

import Foundation
import UIKit

extension UIButton {
    
    func configureBtn(with title: String, image: String) {
     
       self.setImage(UIImage(named: image), for: .normal)
        self.backgroundColor = .white
        self.layer.cornerRadius = 10
        self.shadowedField()
        self.heightAnchor.constraint(equalToConstant: 50).isActive = true
        self.widthAnchor.constraint(equalToConstant: 150).isActive = true
    }
    func shadowedField() {
        
         self.layer.shadowColor = hexStringToUIColor(hex: "#E8EBFF").cgColor
        self.layer.shadowRadius = 10
        self.layer.shadowOpacity = 0.8
        self.layer.shadowOffset = CGSize(width: 19,
                                             height: 19)
        
    }
}
