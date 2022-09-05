//
//  FiltersCells.swift
//  JobLabFinal
//
//  Created by Natia's Mac on 05.09.22.
//

import Foundation
import UIKit

extension UIView {
    func addTitleOnBsheet(with systemName: String, title: String) -> UIView {
    
        let titleView = makeView(with: systemName, textlabl: title)
        self.addSubview(titleView)
        titleView.anchor(top: self.topAnchor,  paddingTop: 10,  width: 250, height: 150)
        titleView.centerX(inView: self)
        return titleView
    }
    
    func makeView( with systemName: String, textlabl: String ) -> UIView {
        let cellView = UIView()
        let cellViewSize = UIScreen.main.bounds.width / 3
        cellView.setDimensions(height: cellViewSize, width: cellViewSize )
        let img = UIImageView()
        let lb = UILabel()
        lb.text = textlabl
        lb.font = .systemFont(ofSize: 14)
   
       
        img.image = UIImage(systemName: systemName ) ?? UIImage(systemName: "person.crop.square.fill")
        img.tintColor = .blue
        cellView.addSubview(img)
        cellView.addSubview(lb)
        img.anchor(top: cellView.topAnchor,  paddingTop: 10, width: 50, height: 50)
        img.centerX(inView: cellView)
        lb.anchor(top: img.bottomAnchor, paddingTop: 15, height: 35 )
        lb.centerX(inView: cellView)
        
        return cellView
    }
    
}
