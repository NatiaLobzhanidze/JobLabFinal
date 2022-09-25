//
//  CollevtionViewSingltones.swift
//  JobLabFinal
//
//  Created by Natia's Mac on 12.09.22.
//

import Foundation
import UIKit


final class CustomCollectionViewConfiguration {
    static var shared = CustomCollectionViewConfiguration()
    private init() { }
    func customCollectionView(direction:  UICollectionView.ScrollDirection, itemSize: CGSize) -> UICollectionView {
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 1.5)
        layout.scrollDirection = direction
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.isScrollEnabled = true
        view.isPagingEnabled = true
        view.isPrefetchingEnabled = true
        view.showsHorizontalScrollIndicator = false
        view.backgroundColor = .white
        view.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 10)
    
        return view
    }
}
