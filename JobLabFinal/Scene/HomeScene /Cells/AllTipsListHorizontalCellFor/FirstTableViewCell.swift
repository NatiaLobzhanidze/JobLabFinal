//
//  FirstTableViewCell.swift
//  JobLabFinal
//
//  Created by Natia's Mac on 07.09.22.
//

import UIKit
protocol OpenAllTipsScene {
    func passData()
}
class FirstTableViewCell: UITableViewCell {
    
    
    var delegate: OpenAllTipsScene!
    
    var forPassData = [TipsModel]() {
        didSet {
//            let vc = AllTipsListSceneConfiguration.configure(with: forPassData)
//            vc.AllTipsContainer = forPassData
            
           // self.delegate.passData(data: forPassData)
        }
    }
    
//    MARK: UI Elements
    var textlb: UILabel = {
       let lb = UILabel()
        lb.text = "Tips for you"
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
    //MARK: @objC methods
      
      @objc func seeAllTipsTapped() {
          print("es mushaobs")
          self.delegate.passData()
      }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier) }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpViews()
    
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        setUpViews()
       
    }

    private func setUpViews() {
        self.contentView.addSubview(textlb)
        textlb.anchor(top: contentView.topAnchor, left: contentView.leftAnchor, bottom: contentView.bottomAnchor, paddingTop: 0, paddingLeft: 30, paddingBottom: 0,  width: 200)
        self.contentView.addSubview(seeAllBtn)
        seeAllBtn.anchor(   right: contentView.rightAnchor, paddingRight: 30, width: 90, height: 27)
        seeAllBtn.centerY(inView: textlb)
        
    }
    
}
