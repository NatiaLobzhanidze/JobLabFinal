//
//  FillterTableViewCell.swift
//  JobLabFinal
//
//  Created by Natia's Mac on 09.09.22.
//

import UIKit

protocol FilterByCategoryDelegate {
    
    func filterByCategory(with title : String)
}

final class FilterTableViewCell: UITableViewCell {
    
    //MARK: Properites
    
    var delegate: FilterByCategoryDelegate!
    
    var allCategories = [String]() {
        didSet {
            self.collectionView.reloadData()
        }
    }
    
    //MARK: View
    
    lazy var collectionView: UICollectionView = {
        let cv = CustomCollectionViewConfiguration.shared.customCollectionView(direction: .horizontal, itemSize: CGSize(width: UIScreen.main.bounds.width / 2, height: UIScreen.main.bounds.width / 2.5 ))
        
        return cv
    }()
    
    //MARK: Object LifeCycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.collectionView.register(FilterCollectionViewCell.self, forCellWithReuseIdentifier: FilterCollectionViewCell.identifier)
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
    
    //MARK: Private Methods
    
    func fillCategories(from objects: [JobModel]) {
            let categoriesSet = Set(objects.map{$0.category})
            self.allCategories = Array(categoriesSet)
            self.allCategories.insert("All Jobs", at: 0)
    }
    
    private func setUpViews() {
        
        self.contentView.addSubview(collectionView)
        collectionView.anchor(top: contentView.topAnchor, left: contentView.leftAnchor, bottom: contentView.bottomAnchor, right: contentView.rightAnchor, paddingTop: 0, paddingLeft: 20, paddingBottom: 0, paddingRight: 0)
    }
}
extension FilterTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        self.delegate?.filterByCategory(with: allCategories[indexPath.row].lowercased())
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  allCategories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellNames = allCategories[indexPath.row]
        let cell = collectionView.deque(FilterCollectionViewCell.self, for: indexPath)
        cell.filtersTitle.text = cellNames
        cell.myview.layer.cornerRadius = 18
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let label = UILabel(frame: CGRect.zero)
        label.text = allCategories[indexPath.row]
        label.sizeToFit()
        
        return CGSize(width: label.frame.width + 35, height: 60)
        
    }
    
}

