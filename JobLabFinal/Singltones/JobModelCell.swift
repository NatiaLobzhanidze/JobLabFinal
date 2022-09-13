//
//  File.swift
//  JobLabFinal
//
//  Created by Natia's Mac on 12.09.22.
//

import Foundation

import UIKit

class JobModelStackview {
    
    static var shared = JobModelStackview()
    private init() { }
    
     func setUpViews(location: UILabel, jobTimeType: UILabel, jobName: UILabel, employerName: UILabel, favoriteButton: UIButton,sallery: UILabel, logoImage: UIImageView, view: UIView ) {
        
          let innerStackview1 = UIStackView(arrangedSubviews: [ jobTimeType])
          innerStackview1.axis = .horizontal
          innerStackview1.distribution = .fillEqually
          innerStackview1.spacing = 0
         // innerStackview1.setDimensions(height: 50, width: 220)
          let stackview1 = UIStackView(arrangedSubviews: [jobName, employerName])
          stackview1.axis = .vertical
          let innerStackview2 = UIStackView(arrangedSubviews: [favoriteButton, sallery])
          innerStackview2.axis = .vertical
          innerStackview2.distribution = .fillProportionally
          innerStackview2.alignment = .fill
          
      
         let mainStackview = UIStackView(arrangedSubviews: [logoImage, stackview1, innerStackview2])
          mainStackview.axis = .horizontal
          mainStackview.distribution = .fill
         mainStackview.spacing = 10
          
          
          view.addSubview(mainStackview)
          mainStackview.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 5, paddingLeft: 15, paddingBottom: 5, paddingRight: 5)
          
      }
}
