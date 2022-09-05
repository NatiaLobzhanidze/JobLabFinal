//
//  Add1stSteackview.swift
//  JobLabFinal
//
//  Created by Natia's Mac on 03.09.22.
//

import Foundation
import UIKit

extension UIViewController {
    func addFirstStackview(textLb: [UILabel], textFld: [UITextField], btn: [UIButton], contentView: UIView) {
        
        //MARK: First StaCkView
        
        let innerStackview1 = UIStackView(arrangedSubviews: [textLb[0], textFld[0]])
        let innerStackview2 = UIStackView(arrangedSubviews: [textLb[1], textFld[1]])
        
        innerStackview2.axis = .vertical
        innerStackview1.spacing = 5
        innerStackview1.axis = .vertical
        innerStackview2.spacing = 5
        
        let mainStackview = UIStackView(arrangedSubviews: [innerStackview1, innerStackview2])
        if textFld.count > 2 {
        let innerstackview = UIStackView(arrangedSubviews: [textLb[5], textFld[2]] )
            innerstackview.axis = .vertical
            innerstackview.spacing = 5
            mainStackview.addArrangedSubview(innerstackview)
            mainStackview.addArrangedSubview(btn[0])
            mainStackview.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 3  ).isActive = true
        } else {
            mainStackview.addArrangedSubview( btn[0])
            mainStackview.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 3.5 ).isActive = true

        }
        contentView.addSubview(mainStackview)
        
    
        mainStackview.axis = .vertical
        mainStackview.distribution = .equalSpacing
        
        mainStackview.anchor(top: textLb[2].bottomAnchor, left: contentView.leftAnchor, right: contentView.rightAnchor, paddingTop: 10, paddingLeft: 30,  paddingRight: 30 )

        //MARK: Second StaCkView
        let horizontalStackview1 = UIStackView(arrangedSubviews: [btn[1], btn[2]])
        horizontalStackview1.axis = .horizontal
        horizontalStackview1.distribution = .equalSpacing
        horizontalStackview1.spacing = 10
        
        let secondMainStackview = UIStackView(arrangedSubviews: [textLb[3], horizontalStackview1])
        contentView.addSubview(secondMainStackview)
        secondMainStackview.axis = .vertical
        secondMainStackview.distribution = .equalSpacing
        secondMainStackview.spacing = 30
        
        secondMainStackview.anchor(top: mainStackview.bottomAnchor, left: contentView.leftAnchor,  right: contentView.rightAnchor, paddingTop: 40, paddingLeft: 30,  paddingRight: 30, height: 100)
        
        // //MARK: Third StaCkView
        
        let thierdStackview = UIStackView(arrangedSubviews: [textLb[4], btn[3]])
        thierdStackview.axis = .horizontal
        thierdStackview.spacing = 0
        thierdStackview.distribution = .fillProportionally
        
        contentView.addSubview(thierdStackview)
        thierdStackview.anchor(top: secondMainStackview.bottomAnchor, bottom: contentView.bottomAnchor, paddingTop: 40, paddingBottom: 10)
        thierdStackview.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
    }
}
