//
//  FillterTableViewCell.swift
//  JobLabFinal
//
//  Created by Natia's Mac on 09.09.22.
//

import UIKit

class FilterTableViewCell: UITableViewCell {
    
    //    MARK: UI Elements
    
    lazy var collectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width / 2, height: UIScreen.main.bounds.width / 2.5 )
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 10
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.isScrollEnabled = true
        view.isPagingEnabled = true
        view.isPrefetchingEnabled = true
        view.showsHorizontalScrollIndicator = false
        view.backgroundColor = .white
        view.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 10)
        
        
        return view
    }()
    
    
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
    
    private func setUpViews() {
        
        self.contentView.addSubview(collectionView)
        collectionView.anchor(top: contentView.topAnchor, left: contentView.leftAnchor, bottom: contentView.bottomAnchor, right: contentView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
    }
}
extension FilterTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  Categories.CategoriesField.categoriesFields.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellNames = Categories.CategoriesField.categoriesFields[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FilterCollectionViewCell.identifier, for: indexPath) as! FilterCollectionViewCell
        
        cell.filtersTitle.text = cellNames
       
        cell.myview.layer.cornerRadius = 20
        return cell
        
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let label = UILabel(frame: CGRect.zero)
            label.text = Categories.CategoriesField.categoriesFields[indexPath.row]
            label.sizeToFit()
            return CGSize(width: label.frame.width + 30, height: 60)
        }
    
}
 
