//
//  SeeAllJobsTableViewCell.swift
//  JobLabFinal
//
//  Created by Natia's Mac on 12.09.22.
//

import UIKit

protocol SeeAllJobsDelegate {
    func didTapSeeALL()
}

final class JobRecomendationsTableViewCell: BaseTableViewCell {

    var delegate: SeeAllJobsDelegate!

    // MARK: View LifeCycle 

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpViews()
        seeAllBtn.addTarget(self, action: #selector(seeAllTipsTapped), for: .touchUpInside)
        selectionStyle = .none
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Methods

    @objc func seeAllTipsTapped() {
        self.delegate.didTapSeeALL()
    }

}
