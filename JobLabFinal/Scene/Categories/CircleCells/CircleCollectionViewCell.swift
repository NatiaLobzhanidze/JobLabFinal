//
//  CircleCollectionViewCell.swift
//  JobLabFinal
//
//  Created by Natia's Mac on 06.09.22.
//

import UIKit

class CircleCollectionViewCell: UICollectionViewCell {
//    lazy var welcomeImage: UIImageView = {
//        let welcomeImage = UIImageView()
//        return welcomeImage
//    }()
    lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.textColor = .white
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
        
      //  self.contentView.addSubview(self.welcomeImage)
        self.contentView.addSubview(self.titleLabel)
//
//        welcomeImage.anchor(top: contentView.topAnchor, left: contentView.leftAnchor,  right: contentView.rightAnchor, paddingTop: 30, paddingLeft: 10, paddingRight: 10, height: 200)
        
        
        titleLabel.anchor(top: contentView.topAnchor, left: contentView.leftAnchor, bottom: contentView.bottomAnchor, right: contentView.rightAnchor, paddingTop: 10, paddingLeft: 10, paddingBottom: 10, paddingRight: 10)
    }
    
    func configure(with item: String){
       // self.welcomeImage.image = item.image
        self.titleLabel.text = item
    }
}
