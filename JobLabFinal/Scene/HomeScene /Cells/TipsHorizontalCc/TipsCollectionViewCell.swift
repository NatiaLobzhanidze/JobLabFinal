//
//  TipsCollectionViewCell.swift
//  JobLabFinal
//
//  Created by Natia's Mac on 07.09.22.
//

import UIKit
protocol SeeDetailsDelegate {
    func seeTipDetailsTap(of: String)
}
final class TipsCollectionViewCell: UICollectionViewCell {

    var delegate: SeeDetailsDelegate!

    // MARK: UI

    let myview: UIView = {
        let v = UIView()

        return v
    }()

    let coverImage: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFit
        img.contentMode = .scaleAspectFill
        img.layer.masksToBounds = true
        img.layer.cornerRadius = 20
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

    // MARK: View LifeCycle

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }

    // MARK: Methods

    @objc func seeMore() {
        guard let txt = self.tipTitle.text else { return }
        self.delegate?.seeTipDetailsTap(of: txt )

    }
    private func setUpView() {

        contentView.addSubview(myview)
        myview.anchor(top: contentView.topAnchor,
                      left: contentView.leftAnchor,
                      bottom: contentView.bottomAnchor,
                      right: contentView.rightAnchor, paddingTop: 0, paddingLeft: 5, paddingBottom: 0, paddingRight: 5)
        myview.addSubview(coverImage)
        coverImage.anchor(top: myview.topAnchor,
                          left: myview.leftAnchor,
                          bottom: myview.bottomAnchor,
                          right: myview.rightAnchor,
                          paddingTop: 5, paddingLeft: 5,
                          paddingBottom: 5, paddingRight: 5)
        myview.addSubview(tipTitle)
        tipTitle.anchor(top: coverImage.topAnchor,
                        right: myview.rightAnchor,
                        paddingTop: 10, paddingRight: 20, width: 120)
        myview.addSubview(seeMoreBtn)
        seeMoreBtn.anchor( top: tipTitle.bottomAnchor,
                           bottom: myview.bottomAnchor,
                           right: coverImage.rightAnchor,
                           paddingTop: 15, paddingBottom: 30,
                           paddingRight: 5, width: 100, height: 35)
    }

    func configure(with model: TipsModel) {
        guard let urlstr = URL(string: model.cover) else { return }
        self.coverImage.load(url: urlstr)
        self.tipTitle.text = model.title
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
