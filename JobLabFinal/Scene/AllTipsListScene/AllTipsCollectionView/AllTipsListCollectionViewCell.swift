//
//  AllTipsListCollectionViewCell.swift
//  JobLabFinal
//
//  Created by Natia's Mac on 11.09.22.
//

import UIKit
protocol GoDetailsDelegate {
    func didTapTip(with model: String)
}

class AllTipsListCollectionViewCell: UICollectionViewCell {

    var delegate: GoDetailsDelegate!

    // MARK: View

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
        lb.textColor = .black
        lb.textAlignment = .right

        return lb
    }()

    lazy var readMoreBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("Read more", for: .normal)
        btn.backgroundColor = .yellow
        btn.layer.cornerRadius = 10
        btn.setTitleColor(.black, for: .normal)
        btn.addTarget(self, action: #selector(goToDetails), for: .touchUpInside)
        return btn
    }()

    @objc func goToDetails(_ sender: UIButton) {
        guard let txt = self.tipTitle.text else { return }
        self.delegate.didTapTip(with: txt)
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

       // setUpView()

    }

    func setUpView() {
//        contentView.addSubview(myview)
//        myview.anchor(top: contentView.topAnchor,
//                      left: contentView.leftAnchor,
//                      bottom: contentView.bottomAnchor,
//                      right: contentView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
        contentView.addSubview(coverImage)
        coverImage.anchor(top: contentView.topAnchor,
                          left: contentView.leftAnchor,
                         bottom: contentView.bottomAnchor,
                       paddingTop: 0, paddingLeft: 0,
                          paddingBottom: 0, width: contentView.frame.width/1.5)
        contentView.addSubview(tipTitle)
        tipTitle.anchor(top: coverImage.topAnchor,
                        left: coverImage.rightAnchor,
                        right: contentView.rightAnchor,   paddingTop: 0, paddingLeft: 15, paddingRight: 15 )
        contentView.addSubview(readMoreBtn)
        readMoreBtn.anchor( top: tipTitle.bottomAnchor, bottom: contentView.bottomAnchor, right: contentView.rightAnchor, paddingTop: 15, paddingBottom: 20, paddingRight: 15, width: 100)
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
