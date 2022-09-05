//
//  AddOnScrollView.swift
//  JobLabFinal
//
//  Created by Natia's Mac on 02.09.22.
//

import Foundation
import UIKit
extension UIViewController {
    
    func addConstreintsToScrollView(scrollView: UIScrollView, contentView: UIView) {
        
        self.view.addSubview(scrollView)
        
        scrollView.anchor(top: self.view.layoutMarginsGuide.topAnchor, left: self.view.leftAnchor, bottom: self.view.bottomAnchor, right: self.view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0 )
        scrollView.addSubview(contentView)
        
        contentView.anchor(top: scrollView.topAnchor, left: scrollView.leftAnchor, bottom: scrollView.bottomAnchor, right: scrollView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
        contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true

    }
}


