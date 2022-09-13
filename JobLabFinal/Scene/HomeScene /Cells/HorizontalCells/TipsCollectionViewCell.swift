//
//  TipsCollectionViewCell.swift
//  JobLabFinal
//
//  Created by Natia's Mac on 07.09.22.
//

import UIKit
protocol SeeDetailsDelegate {
    func seeDetails(of : String)
}
class TipsCollectionViewCell: UICollectionViewCell {
    
    var delegate: SeeDetailsDelegate!
    
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
        lb.font = .systemFont(ofSize: 19, weight: .semibold)
        lb.textColor = .white
        lb.textAlignment = .right
        
        return lb
    }()
    
    
    lazy var seeMoreBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("Read more", for: .normal)
        btn.backgroundColor = .yellow
        btn.layer.cornerRadius = 15
        btn.setTitleColor(.cyan, for: .normal)
        btn.isEnabled = true
        btn.addTarget(self, action: #selector(self.seeMore), for: .touchUpInside)
        
        return btn
    }()
    @objc func forTest() {
        print("tapped")
    }
    override func prepareForReuse() {
                super.prepareForReuse()
        }
        
        override init(frame: CGRect) {
                super.init(frame: frame)
            setUpView()
        }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    //MARK: Methods

    @objc func seeMore(){
        guard let txt = self.tipTitle.text else { return }
        self.delegate?.seeDetails(of: txt )
        
    }
   private func setUpView() {
        contentView.addSubview(myview)
        myview.anchor(top: contentView.topAnchor, left: contentView.leftAnchor, bottom: contentView.bottomAnchor, right: contentView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
        myview.addSubview(coverImage)
        coverImage.anchor(top: myview.topAnchor, left: myview.leftAnchor, bottom: myview.bottomAnchor, right: myview.rightAnchor, paddingTop: 0, paddingLeft: 5, paddingBottom: 5, paddingRight: 5)
        myview.addSubview(tipTitle)
        tipTitle.anchor(top: myview.topAnchor, right: myview.rightAnchor, paddingTop: 0, paddingRight: 20 , width: 120)
        myview.addSubview(seeMoreBtn)
       seeMoreBtn.anchor( top: tipTitle.bottomAnchor, bottom: myview.bottomAnchor, right: coverImage.rightAnchor, paddingTop: 15, paddingBottom: 30, paddingRight: 5 , width: 100, height: 40)
    }
   
    
    func configure(with model: TipsModel) {
        let urlstr = model.cover
        self.coverImage.load(url: URL(string: urlstr)!)
        self.tipTitle.text = model.title
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
            }
}
