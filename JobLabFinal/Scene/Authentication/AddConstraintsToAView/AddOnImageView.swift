//
//  AddOnImageCiew.swift
//  JobLabFinal
//
//  Created by Natia's Mac on 02.09.22.
//

import Foundation
import UIKit

extension UIViewController {
    
    func addConstraintsToImage(contentView: UIView, logoImage: UIImageView) {
        contentView.addSubview(logoImage)
        logoImage.anchor(top: contentView.topAnchor, paddingTop: 0)
        logoImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        logoImage.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 1 / 2 ).isActive = true
        logoImage.heightAnchor.constraint(equalTo: logoImage.widthAnchor, multiplier: 1 / 1.2 ).isActive = true
    }
    
    
}
