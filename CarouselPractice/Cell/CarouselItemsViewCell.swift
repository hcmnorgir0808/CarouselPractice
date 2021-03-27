//
//  CarouselItemsViewCell.swift
//  CarouselPractice
//
//  Created by yaiwamoto on 2021/03/27.
//

import UIKit

class CarouselItemsViewCell: UICollectionViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.register(with: CarouselItemCollectionViewCell.self)
    }
}

extension CarouselItemsViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 15
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(with: CarouselItemCollectionViewCell.self, for: indexPath)
            .set(number: indexPath.row)
            .setCorner()
        return cell
    }
}

extension CarouselItemsViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 150)
    }
}
