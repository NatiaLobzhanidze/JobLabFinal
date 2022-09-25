//
//  CollectionViewCell.swift
//  JobLabFinal
//
//  Created by Natia's Mac on 09.09.22.
//

import UIKit

final class FilterCollectionViewCell: UICollectionViewCell {
    
    let myview: UIView = {
        let v = UIView()
        v.layer.borderWidth = 2
        v.layer.borderColor = UIColor.tintColor.cgColor
        
        return v
    }()
    
    let filtersTitle: UILabel = {
        let lb = UILabel()
        lb.textColor = .tintColor
        lb.font = .systemFont(ofSize: 16, weight: .semibold)
        return lb
    }()
    override func prepareForReuse() {
                super.prepareForReuse()
        setUpView()
        }
        override init(frame: CGRect) {
                super.init(frame: frame)
            setUpView()
        }
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpView()
    }
    
    func setUpView() {
        contentView.addSubview(myview)
        myview.anchor(top: contentView.topAnchor, left: contentView.leftAnchor, bottom: contentView.bottomAnchor, right: contentView.rightAnchor, paddingTop: 10, paddingLeft: 0, paddingBottom: 10, paddingRight: 0)
        myview.addSubview(filtersTitle)
        filtersTitle.centerX(inView: myview)
        filtersTitle.centerY(inView: myview)
    }
    required init?(coder aDecoder: NSCoder) {
                    fatalError("init(coder:) has not been implemented")
            }
}
