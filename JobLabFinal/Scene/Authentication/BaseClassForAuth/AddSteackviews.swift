//
//  Add1stSteackview.swift
//  JobLabFinal
//
//  Created by Natia's Mac on 03.09.22.
//

import Foundation
import UIKit

extension UIStackView {
    func beStackView(axis: NSLayoutConstraint.Axis ,space : CGFloat, distribution: Distribution?) {
        self.axis = axis
        self.spacing = space
        guard let distribution = distribution else {
            return
        }
        self.distribution = distribution
    }
}
//
//extension UIViewController {
//  
//    func addStackviews(textLb: [UILabel], textFld: [UITextField], btn: [UIButton], contentView: UIView) {
//        
//        //MARK: First StaCkView
//        
//        let innerStackview1 = UIStackView(arrangedSubviews: [textLb[0], textFld[0]])
//        let innerStackview2 = UIStackView(arrangedSubviews: [textLb[1], textFld[1]])
//        innerStackview2.bestackView(axis: .vertical, space: 5, distribution: .equalSpacing)
//        innerStackview1.bestackView(axis: .vertical, space: 5, distribution: .equalSpacing)
//        
//        let mainStackview = UIStackView(arrangedSubviews: [innerStackview1, innerStackview2])
//        
//        if textFld.count > 2 {
//        let innerstackview3 = UIStackView(arrangedSubviews: [textLb[5], textFld[2]] )
//            innerstackview3.bestackView(axis: .vertical, space: 10, distribution: .equalSpacing)
//            mainStackview.addArrangedSubview(innerstackview3)
//           
//        }
//        mainStackview.addArrangedSubview( btn[0])
//        mainStackview.bestackView(axis: .vertical, space: 10, distribution: .equalSpacing)
//        
//        contentView.addSubview(mainStackview)
//        mainStackview.anchor(top: textLb[2].bottomAnchor, left: contentView.leftAnchor, right: contentView.rightAnchor, paddingTop: 15, paddingLeft: 30,  paddingRight: 30 )
//
//        //MARK: Second StackView
//        
//        let horizontalStackview1 = UIStackView(arrangedSubviews: [btn[1], btn[2]])
//        horizontalStackview1.bestackView(axis: .horizontal, space: 10, distribution: .equalSpacing)
//        let secondMainStackview = UIStackView(arrangedSubviews: [textLb[3], horizontalStackview1])
//        
//        contentView.addSubview(secondMainStackview)
//        secondMainStackview.bestackView(axis: .vertical, space: 20, distribution: .equalSpacing)
//        secondMainStackview.anchor(top: mainStackview.bottomAnchor, left: contentView.leftAnchor,  right: contentView.rightAnchor, paddingTop: 30, paddingLeft: 30,  paddingRight: 30)
//        
//        // //MARK: Third StackView
//        
//        let thierdStackview = UIStackView(arrangedSubviews: [textLb[4], btn[3]])
//        thierdStackview.bestackView(axis: .horizontal, space: 5, distribution: .fillProportionally)
//        
//        contentView.addSubview(thierdStackview)
//        thierdStackview.anchor(top: secondMainStackview.bottomAnchor, bottom: contentView.bottomAnchor, paddingTop: 40, paddingBottom: 20)
//        thierdStackview.centerX(inView: contentView)
//    }
//}
