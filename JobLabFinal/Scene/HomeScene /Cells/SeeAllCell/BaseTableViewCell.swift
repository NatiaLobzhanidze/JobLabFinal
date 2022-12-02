//
//  BaseTableViewCell.swift
//  JobLabFinal
//
//  Created by Natia's Mac on 20.09.22.
//

import UIKit

class BaseTableViewCell: UITableViewCell {

    // MARK: UI

    let textlb: UILabel = {
        let lb = UILabel()
        lb.font = .systemFont(ofSize: 16)
        return lb
    }()

    let seeAllBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("See all", for: .normal)
        btn.setTitleColor(.tintColor, for: .normal)

        return btn
    }()

    // MARK: View LifeCycle

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    // MARK: SetUp UI

    func setUpViews() {
        self.contentView.addSubview(textlb)
        textlb.anchor(top: contentView.topAnchor,
                      left: contentView.leftAnchor,
                      bottom: contentView.bottomAnchor,
                      paddingTop: 0, paddingLeft: 30,
                      paddingBottom: 0,   width: 200)
        self.contentView.addSubview(seeAllBtn)
        seeAllBtn.anchor( right: contentView.rightAnchor,
                          paddingRight: 30,
                          width: 90, height: 27)
        seeAllBtn.centerY(inView: textlb)
    }
}
