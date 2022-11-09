//
//  LayoutInformation.swift
//  JobLabFinal
//
//  Created by Natia's Mac on 06.09.22.
//

import Foundation
import UIKit

extension UICollectionViewCell {
    
    func addview(with title: String) {
        
        let backView = UIView()
        self.contentView.addSubview(backView)
        backView.center(inView: self.contentView)
        let backViewSize = contentView.frame.size.width/2.5
        
        backView.setDimensions(height: backViewSize, width: backViewSize)
        backView.layer.cornerRadius = backViewSize/2
        backView.backgroundColor =  hexStringToUIColor(hex: "#EAF1FD")
        
        let image = UIImageView()
        image.image = UIImage(named: title)
        backView.addSubview(image)
        image.center(inView: backView)
        image.setDimensions(height: backViewSize - 20, width: backViewSize - 20)
        //image.tintColor = hexStringToUIColor(hex: "#4F7EF7")
        image.tintColor = .brown
        let categoryTitle = UILabel()
        categoryTitle.text = title
        self.contentView.addSubview(categoryTitle)
        categoryTitle.centerX(inView: self.contentView)
        categoryTitle.anchor(top: backView.bottomAnchor, bottom: self.contentView.bottomAnchor,  paddingTop: 10, paddingBottom: 10)
    }
}
