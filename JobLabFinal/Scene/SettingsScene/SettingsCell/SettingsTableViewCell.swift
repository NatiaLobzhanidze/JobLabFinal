//
//  SettingsTableViewCell.swift
//  JobLabFinal
//
//  Created by Natia's Mac on 20.09.22.
//

import UIKit

final class SettingsTableViewCell: UITableViewCell {
    
    let logoImage = UIImageView()
    let titleLb = UILabel()

    override func awakeFromNib() {
        super.awakeFromNib()
        setUpView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        setUpView()
        selectionStyle = .none
        super.setSelected(selected, animated: animated)
}

    //MARK: setup view
    
    private func setUpView() {
        contentView.addSubview(logoImage)
        logoImage.anchor(top: contentView.topAnchor, left: contentView.leftAnchor,  paddingTop: 15, paddingLeft: 15,  width: 30, height: 30)
        contentView.addSubview(titleLb)
        titleLb.anchor( left: logoImage.rightAnchor,  paddingLeft: 20, width: 120)
        titleLb.centerY(inView: logoImage)
        
    }
    
}
