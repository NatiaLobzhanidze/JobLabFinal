//
//  AddHeadLine.swift
//  JobLabFinal
//
//  Created by Natia's Mac on 02.09.22.
//

import Foundation
import UIKit

extension UIViewController {
    func addHeadLine(contentView: UIView, headLineLb: UILabel, logoImage: UIImageView ) {
        contentView.addSubview(headLineLb)
        headLineLb.anchor(top: logoImage.bottomAnchor, left: contentView.leftAnchor, right: contentView.rightAnchor, paddingTop: 0, paddingLeft: 30,  paddingRight: 30, height: 30)
    }
}

