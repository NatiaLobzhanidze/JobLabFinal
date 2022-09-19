//
//  File.swift
//  JobLabFinal
//
//  Created by Natia's Mac on 12.09.22.
//

import Foundation

import UIKit

final class JobModelStackview {
    
    static var shared = JobModelStackview()
    private init() { }
    
     func setUpViews(location: UILabel, jobTimeType: UILabel, jobName: UILabel, employerName: UILabel, favoriteButton: UIButton,sallery: UILabel, logoImage: UIImageView, view: UIView ) {
         view.addSubview(logoImage)
         logoImage.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor,  paddingTop: 10, paddingLeft: 20, paddingBottom: 10)

          let stackview1 = UIStackView(arrangedSubviews: [jobName, employerName])
          stackview1.axis = .vertical
          stackview1.spacing = 10
          stackview1.distribution = .fill
      
         let mainStackview = UIStackView(arrangedSubviews: [stackview1, favoriteButton])
          mainStackview.axis = .horizontal
          mainStackview.distribution = .fill
          mainStackview.spacing = 10
          
          view.addSubview(mainStackview)
          mainStackview.anchor(top: logoImage.topAnchor, left: logoImage.rightAnchor, bottom: logoImage.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 25, paddingBottom: 0, paddingRight: 20)
          
      }
}
