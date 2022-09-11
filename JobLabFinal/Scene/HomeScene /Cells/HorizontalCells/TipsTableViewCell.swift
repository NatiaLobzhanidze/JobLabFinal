//
//  TipsTableViewCell.swift
//  JobLabFinal
//
//  Created by Natia's Mac on 07.09.22.
//

import UIKit

class TipsTableViewCell: UITableViewCell {
    //MARK: properties
    
    var tipsArray = [TipsModel](){
        didSet {
            self.collectionView.reloadData()
        }
    }
    
    let cellShadows = ["#81B6F4", "#4CA8CF", "#F2B53F", "#ECACB0"]
    
    //MARK: UI Elements
    
    lazy var collectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 300, height: 220)
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 10
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.isScrollEnabled = true
        view.isPagingEnabled = true
        view.isPrefetchingEnabled = true
        view.showsHorizontalScrollIndicator = false
        view.backgroundColor = .white
        view.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        
        return view
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.collectionView.register(TipsCollectionViewCell.self, forCellWithReuseIdentifier: TipsCollectionViewCell.identifier)
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        selectionStyle = .none
    }

    
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
        self.contentView.addSubview(collectionView)
        collectionView.anchor(top: contentView.topAnchor, left: contentView.leftAnchor, bottom: contentView.bottomAnchor, right: contentView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
    }
}
extension TipsTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tipsArray.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TipsCollectionViewCell.identifier, for: indexPath) as! TipsCollectionViewCell
        cell.configure(with: tipsArray[indexPath.row])
        cell.myview.dropShadow(color: hexStringToUIColor(hex: cellShadows[indexPath.row]), opacity: 0.5, offSet: CGSize(width: 20, height: 20), radius: 8, scale: true)
        return cell
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width - 20, height: 220)
    }
}



