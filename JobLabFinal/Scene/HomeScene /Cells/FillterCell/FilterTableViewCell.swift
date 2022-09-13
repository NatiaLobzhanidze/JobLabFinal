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
        let cv = CustomCollectionViewConfiguration.shared.customCollectionView(direction: .horizontal, itemSize: CGSize(width: UIScreen.main.bounds.width / 2, height: UIScreen.main.bounds.width / 2.5 ))
        
        return cv
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
        collectionView.anchor(top: contentView.topAnchor, left: contentView.leftAnchor, bottom: contentView.bottomAnchor, right: contentView.rightAnchor, paddingTop: 0, paddingLeft: 20, paddingBottom: 0, paddingRight: 0)
    }
}
extension FilterTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if let cell = collectionView.cellForItem(at: indexPath) as? FilterCollectionViewCell {
            if indexPath.row != 0 {
               //send Delegate or notification
            }
            UIView.animate(withDuration: 0.7) {
                
                cell.myview.backgroundColor =  cell.myview.backgroundColor != .tintColor  ? .tintColor : .white
                cell.filtersTitle.textColor = cell.filtersTitle.textColor != .white ?  .white : .tintColor
            }
                    }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  Categories.CategoriesField.categoriesFields.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellNames = Categories.CategoriesField.categoriesFields[indexPath.row]
        let cell = collectionView.deque(FilterCollectionViewCell.self, for: indexPath)
        cell.filtersTitle.text = cellNames
        cell.myview.layer.cornerRadius = 18
        
        if cellNames == "All" {
            cell.myview.backgroundColor = .tintColor
            cell.filtersTitle.textColor = .white
        } else {
            cell.myview.backgroundColor = .white
            cell.filtersTitle.textColor = .tintColor
        }
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let label = UILabel(frame: CGRect.zero)
            label.text = Categories.CategoriesField.categoriesFields[indexPath.row]
            label.sizeToFit()
        if indexPath.row == 0 {
            return CGSize(width: 80, height: 60)
        } else {
            return CGSize(width: label.frame.width + 35, height: 60)
            }
        }
    
}
 
