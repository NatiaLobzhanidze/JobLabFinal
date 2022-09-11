//
//  TipsCollectionViewCell.swift
//  JobLabFinal
//
//  Created by Natia's Mac on 07.09.22.
//

import UIKit

class TipsCollectionViewCell: UICollectionViewCell {
    
    let myview: UIView = {
        let v = UIView()
     
        return v
        
    }()
    
    let coverImage: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFill
        img.layer.cornerRadius = 40
      
        img.layer.masksToBounds = true
       
        return  img
    }()
    
    let tipTitle: UILabel = {
        let lb = UILabel()
        lb.numberOfLines = 0
        lb.font = .systemFont(ofSize: 20, weight: .semibold)
        lb.textColor = .white
        lb.textAlignment = .right
        
        return lb
    }()
    
    let seeMoreBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("Read more", for: .normal)
        btn.backgroundColor = .yellow
        btn.layer.cornerRadius = 10
        btn.setTitleColor(.black, for: .normal)
        return btn
    }()
    
    
    override func prepareForReuse() {
                super.prepareForReuse()
        }
        
        override init(frame: CGRect) {
                super.init(frame: frame)
            setUpView()
        
        }
    override func awakeFromNib() {
        super.awakeFromNib()
    
       // setUpView()
                
    }
    
    func setUpView() {
        contentView.addSubview(myview)
        myview.anchor(top: contentView.topAnchor, left: contentView.leftAnchor, bottom: contentView.bottomAnchor, right: contentView.rightAnchor, paddingTop: 5, paddingLeft: 5, paddingBottom: 5, paddingRight: 5)
        myview.addSubview(coverImage)
        coverImage.anchor(top: myview.topAnchor, left: myview.leftAnchor, bottom: myview.bottomAnchor, right: myview.rightAnchor, paddingTop: 0, paddingLeft: 5, paddingBottom: 5, paddingRight: 5)
        coverImage.addSubview(tipTitle)
        tipTitle.anchor(top: coverImage.topAnchor, right: coverImage.rightAnchor, paddingTop: 20, paddingRight: 15 , width: 150)
        coverImage.addSubview(seeMoreBtn)
        seeMoreBtn.anchor( bottom: contentView.bottomAnchor,right: coverImage.rightAnchor, paddingBottom: 30, paddingRight: 5 , width: 100, height: 40)
    }
    required init?(coder aDecoder: NSCoder) {
                    fatalError("init(coder:) has not been implemented")
            }
    
    func configure(with model: TipsModel) {
        let urlstr = model.cover
    
        self.coverImage.load(url: URL(string: urlstr)!)
       
        
        self.tipTitle.text = model.title
       
    }
}
