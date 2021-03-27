//
//  UICollectionView+.swift
//  CarouselPractice
//
//  Created by yaiwamoto on 2021/03/27.
//

import UIKit

extension UICollectionView {
    public func register<T: UICollectionViewCell>(with type: T.Type) {
        let nib = UINib(nibName: type.className, bundle: nil)
        register(nib, forCellWithReuseIdentifier: type.className)
    }
    
    public func register<T: UICollectionReusableView>(
        reusableViewType: T.Type,
        ofKind kind: String = UICollectionView.elementKindSectionHeader,
        bundle: Bundle? = nil
    ) {
        let className = reusableViewType.className
        let nib = UINib(nibName: className, bundle: bundle)
        register(nib, forSupplementaryViewOfKind: kind, withReuseIdentifier: className)
    }
    
    public func dequeueReusableCell<T: UICollectionViewCell>(
        with type: T.Type,
        for indexPath: IndexPath
    ) -> T {
        dequeueReusableCell(withReuseIdentifier: type.className, for: indexPath) as! T
    }
    
    public func dequeueReusableView<T: UICollectionReusableView>(
        with type: T.Type,
        for indexPath: IndexPath,
        ofKind kind: String = UICollectionView.elementKindSectionHeader
    ) -> T {
        dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: type.className, for: indexPath) as! T
    }
}
