//
//  PageControllFuncs .swift
//  JobLabFinal
//
//  Created by Natia's Mac on 02.09.22.
//

import Foundation
import UIKit

extension OnBoardingViewController {
   
    
    func changePage (on collectionView: UICollectionView){
        if currentPage == dataSource.count - 1  {
            print("succesfully done")
            router?.navigateToAuthentication()
        } else {
            collectionView.isPagingEnabled = false
            currentPage += 1
            let indexPath = IndexPath(item: currentPage, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            collectionView.reloadData()
            collectionView.isPagingEnabled = true
        }
    }
    
    @objc func pageControllerAction(_ sender: UIPageControl, collectionView: UICollectionView) {
        let page: Int = sender.currentPage
        print(page)
        collectionView.scrollToItem(at: IndexPath(row: page, section: 0), at: .centeredHorizontally, animated: true)
        changePage(on: collectionView)
    }
   
}
