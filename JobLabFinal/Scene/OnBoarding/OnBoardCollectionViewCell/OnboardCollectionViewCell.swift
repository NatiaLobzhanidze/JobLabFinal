//
//  OnboardTableViewCell.swift
//  JobLabFinal
//
//  Created by Natia's Mac on 31.08.22.
//

import Foundation
import UIKit

final class OnBoardingCollectionViewCell: UICollectionViewCell {

    // MARK: UI

   private let welcomeImage = UIImageView()

   private let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.textColor = .blue
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 0
        titleLabel.font = UIFont.systemFont(ofSize: 20)
        titleLabel.clipsToBounds = true
        return titleLabel
    }()

    // MARK: Object lifeCycle

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    // MARK: set up UI

    private func setUpView() {
        self.contentView.addSubview(self.welcomeImage)
        self.contentView.addSubview(self.titleLabel)
        welcomeImage.anchor(top: contentView.topAnchor,
                            left: contentView.leftAnchor,
                            right: contentView.rightAnchor,
                            paddingTop: 30, paddingLeft: 10,
                            paddingRight: 10, height: 200)

        titleLabel.anchor(top: welcomeImage.bottomAnchor,
                          left: contentView.leftAnchor,
                          bottom: contentView.bottomAnchor,
                          right: contentView.rightAnchor,
                          paddingTop: 10, paddingLeft: 20,
                          paddingBottom: 20, paddingRight: 20,
                          height: 50)
    }

    // MARK: Configuration method

    func configure(with item: OnBoardingModel) {
        self.welcomeImage.image = item.image
        self.titleLabel.text = item.title
    }
}
