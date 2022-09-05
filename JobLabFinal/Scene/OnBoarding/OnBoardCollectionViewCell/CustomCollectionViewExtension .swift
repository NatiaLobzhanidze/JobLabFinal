//
//  CollectionViewExtension .swift
//  JobLabFinal
//
//  Created by Natia's Mac on 01.09.22.
//

import Foundation
import UIKit

extension OnBoardingViewController {
    
    func customCollectionView() -> UICollectionView {
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 1.5)
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
    }
}
