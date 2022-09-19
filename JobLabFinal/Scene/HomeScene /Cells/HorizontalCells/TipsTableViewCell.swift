//
//  TipsTableViewCell.swift
//  JobLabFinal
//
//  Created by Natia's Mac on 07.09.22.
//

import UIKit

protocol SendDelegatTovc {
    
    func passDataToVc(of: String)
}

class TipsTableViewCell: UITableViewCell {
    
    //MARK: properties
    var delegate : SendDelegatTovc!
    var conteiner: String = "" {
        didSet {
            self.delegate.passDataToVc(of: conteiner)
        }
    }
    
    var tipsArray = [TipsModel](){
        didSet {
            self.collectionView.reloadData()
        }
    }
    
    //MARK: UI
    
    lazy var collectionView: UICollectionView = {
        let cv = CustomCollectionViewConfiguration.shared.customCollectionView(direction: .horizontal, itemSize: CGSize(width: 290, height: 160))
//        let layout = UICollectionViewFlowLayout()
//        layout.itemSize = CGSize(width: 290, height: 160)
//        layout.scrollDirection = .horizontal
//        layout.minimumInteritemSpacing = 10
//        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        view.isScrollEnabled = true
//        view.isPagingEnabled = true
//        view.isPrefetchingEnabled = true
//        view.showsHorizontalScrollIndicator = false
//        view.backgroundColor = .white
//        view.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        cv.delegate = self
        cv.dataSource = self
        
        return cv
    }()
        
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.collectionView.registerClass(class: TipsCollectionViewCell.self)
        setUpViews()
        selectionStyle = .none
       
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
    
    //MARK: setUp UI
    private func setUpViews() {
        self.contentView.addSubview(collectionView)
        collectionView.anchor(top: contentView.topAnchor,
                              left: contentView.leftAnchor,
                              bottom: contentView.bottomAnchor,
                              right: contentView.rightAnchor,
                              paddingTop: 0, paddingLeft: 0,
                              paddingBottom: 0, paddingRight: 0)
    }
}

extension TipsTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tipsArray.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TipsCollectionViewCell.identifier, for: indexPath) as! TipsCollectionViewCell
        cell.configure(with: tipsArray[indexPath.row])
        cell.delegate = self
        return cell
    }
}

//MARK: SeeDetailsDelegate  method
extension TipsTableViewCell : SeeDetailsDelegate {
    func seeTipDetailsTap(of: String) {
        self.conteiner = of
    }
}

