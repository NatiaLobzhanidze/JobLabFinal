//
//  TipsTableViewCell.swift
//  JobLabFinal
//
//  Created by Natia's Mac on 07.09.22.
//

import UIKit

protocol SendDelegatTovc {
    
    func passDataToVc(of selectedTip: String)
}

final class TipsTableViewCell: UITableViewCell {
    
    //MARK: properties
    
    var delegate : SendDelegatTovc!
    
    var conteiner = String() {
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
        let cv = CustomCollectionViewConfiguration.shared.customCollectionView(direction: .horizontal, itemSize: CGSize(width: 290, height: 170))
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

    //MARK: UICollectionViewDataSource

extension TipsTableViewCell: UICollectionViewDataSource  {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return tipsArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.deque(TipsCollectionViewCell.self, for: indexPath)
        cell.configure(with: tipsArray[indexPath.row])
        cell.shadowedtoView()
        cell.delegate = self
        return cell
    }
}

extension TipsTableViewCell: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 250, height: 200)
    }
}

//MARK: SeeDetailsDelegate  method
extension TipsTableViewCell : SeeDetailsDelegate {
    func seeTipDetailsTap(of selectedTip: String) {
        self.conteiner = selectedTip
    }
}

