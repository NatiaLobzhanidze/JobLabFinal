//
//  RequirementsCell.swift
//  JobLabFinal
//
//  Created by Natia's Mac on 15.09.22.
//

import Foundation
import UIKit

class RequirementsTableViewCell: UITableViewCell {
    
    //MARK: View
   lazy var checkMarkImage : UIImageView = {
        let img = UIImageView()
        img.image = UIImage(systemName: "checkmark.circle")
        img.setDimensions(height: 20, width: 20)
        return img
    }()
    
    
    lazy var requirementsText: UILabel = {
       let lb = UILabel()
        lb.font = .systemFont(ofSize: 14)
        lb.numberOfLines = 0
        return lb
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpViews()
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        setUpViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
//    override func layoutSubviews() {
//        super.layoutSubviews()
//
//        //set the values for top,left,bottom,right margins
//           let margins = UIEdgeInsets(top: 5, left: 8, bottom: 5, right: 8)
//           contentView.frame = contentView.frame.inset(by: margins)
//           contentView.layer.cornerRadius = 8
//    }

    //MARK: Private Methods
    
    private func setUpViews() {
       
        contentView.addSubview(checkMarkImage)
        checkMarkImage.anchor(left: contentView.leftAnchor,  paddingLeft: 10, width: 35 )
        contentView.addSubview(requirementsText)
        checkMarkImage.centerY(inView: requirementsText)
        requirementsText.anchor(top: contentView.topAnchor,
                                left: checkMarkImage.rightAnchor,
                                bottom: contentView.bottomAnchor,
                                right: contentView.rightAnchor, paddingTop: 5,paddingLeft: 5, paddingBottom: 5, paddingRight: 10)
    }
    
}

