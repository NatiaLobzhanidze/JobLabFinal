//
//  TipsTableViewCell.swift
//  JobLabFinal
//
//  Created by Natia's Mac on 07.09.22.
//

import UIKit

protocol SendDelegatTovc {
    func passDataToVc(with model: String)
}

class TipsTableViewCell: UITableViewCell {
    
    //MARK: properties
    
    var delegate : SendDelegatTovc!
    
    var conteiner: String = "" {
        didSet {
            self.delegate.passDataToVc(with: conteiner)
        }
    }
    
    var tipsArray = [TipsModel](){
        didSet {
            self.collectionView.reloadData()
        }
    }
    
    let cellShadows = ["#81B6F4", "#4CA8CF", "#F2B53F", "#ECACB0"]
    
    //MARK: UI Elements
    
    lazy var collectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 290, height: 160)
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 10
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.isScrollEnabled = true
        view.isPagingEnabled = true
        view.isPrefetchingEnabled = true
        view.showsHorizontalScrollIndicator = false
        view.backgroundColor = .white
        view.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
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
        cell.delegate = self
        return cell
    }
}

extension TipsTableViewCell : SeeDetailsDelegate {
    func seeDetails(of: String) {
        print("we have tipsTable viewCell here ")
        self.conteiner = of
        
    }
}
