//
//  CollectionViewExtensions.swift
//  JobLabFinal
//
//  Created by Natia's Mac on 01.09.22.
//

import Foundation
import UIKit
extension UICollectionViewCell {
    static var identifier: String {
        return String(describing: self)
    }

    static func nib() -> UINib {
        return UINib(nibName: String(describing: self), bundle: Bundle.main)
    }
}

extension UICollectionView {
    func registerNib<T: UICollectionViewCell>(class: T.Type) {
        self.register(T.nib(), forCellWithReuseIdentifier: T.identifier)
    }

    func registerClass<T: UICollectionViewCell>(class: T.Type) {
        self.register(T.self, forCellWithReuseIdentifier: T.identifier)
    }

    func deque<T: UICollectionViewCell>(_ classType: T.Type, for indexPath: IndexPath) -> T {
        return dequeueReusableCell(withReuseIdentifier: T.identifier, for: indexPath) as! T
    }

    private enum PillCellSpacing: CGFloat {
        case defaultValue = 10.0
    }
}
