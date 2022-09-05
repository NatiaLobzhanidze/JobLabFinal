//
//  OnboardTableViewCell.swift
//  JobLabFinal
//
//  Created by Natia's Mac on 31.08.22.
//

import Foundation
import UIKit


class OnBoardingCollectionViewCell: UICollectionViewCell {
    
    
    lazy var welcomeImage: UIImageView = {
        let welcomeImage = UIImageView()
        return welcomeImage
    }()
    lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.textColor = .blue
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 0
        titleLabel.font = UIFont.systemFont(ofSize: 20)
        titleLabel.isUserInteractionEnabled = true
        titleLabel.clipsToBounds = true
        return titleLabel
    }()
    
     override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
     required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        
        self.contentView.addSubview(self.welcomeImage)
        self.contentView.addSubview(self.titleLabel)
        
        welcomeImage.anchor(top: contentView.topAnchor, left: contentView.leftAnchor,  right: contentView.rightAnchor, paddingTop: 30, paddingLeft: 10, paddingRight: 10, height: 200)
        
        
        titleLabel.anchor(top: welcomeImage.bottomAnchor, left: contentView.leftAnchor, bottom: contentView.bottomAnchor, right: contentView.rightAnchor, paddingTop: 10, paddingLeft: 20, paddingBottom: 20, paddingRight: 20, height: 50)
    }
    
    func configure(with item: OnBoardingModel){
        self.welcomeImage.image = item.image
        self.titleLabel.text = item.title
    }
}

