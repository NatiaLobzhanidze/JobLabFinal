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

final class SeeAllJobsTableViewCell: UITableViewCell {
  
    var delegate: SeeAllJobsDelegate!
    
    //MARK: UI
    
    var textlb: UILabel = {
       let lb = UILabel()
        lb.text = "Job recomendations"
        lb.font = .systemFont(ofSize: 16)
        return lb
    }()
    
    let seeAllBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("See all", for: .normal)
        btn.setTitleColor(.tintColor, for: .normal)
        btn.addTarget(self, action: #selector(seeAllTipsTapped), for: .touchUpInside)
        
        return btn
        
    }()
    
    //MARK: View LifeCycle 
 
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpViews()
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
    
    //MARK: Methods
    
    @objc func seeAllTipsTapped() {
        self.delegate.didTapSeeALL()
    }
    
    //MARK: SetUp UI
    
    private func setUpViews() {
        self.contentView.addSubview(textlb)
        textlb.anchor(top: contentView.topAnchor, left: contentView.leftAnchor, bottom: contentView.bottomAnchor, paddingTop: 0, paddingLeft: 30, paddingBottom: 0,  width: 200)
        self.contentView.addSubview(seeAllBtn)
        seeAllBtn.anchor(   right: contentView.rightAnchor, paddingRight: 30, width: 90, height: 27)
        seeAllBtn.centerY(inView: textlb)
        
    }
}
