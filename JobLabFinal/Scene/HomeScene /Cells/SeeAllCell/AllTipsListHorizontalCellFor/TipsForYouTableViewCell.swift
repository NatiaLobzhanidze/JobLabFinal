//
//  FirstTableViewCell.swift
//  JobLabFinal
//
//  Created by Natia's Mac on 07.09.22.
//

import UIKit

protocol OpenAllTipsScene {
    func seeAllTipsTap()
}
final class TipsForYouTableViewCell: BaseTableViewCell {
    
    //MARK: Fields
    
    var delegate: OpenAllTipsScene!
 
    //MARK: View LifeCycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpViews()
        seeAllBtn.addTarget(self, action: #selector(seeAllTipsTapped), for: .touchUpInside)
        self.selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    //MARK: @objC methods
      
      @objc func seeAllTipsTapped() {
          self.delegate.seeAllTipsTap()
      }
    
}
