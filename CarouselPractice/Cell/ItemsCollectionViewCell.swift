//
//  ItemsCollectionViewCell.swift
//  CarouselPractice
//
//  Created by yaiwamoto on 2021/03/27.
//

import UIKit

class ItemsCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
        
    private static var cell: ItemsCollectionViewCell = {
        UINib(nibName: ItemsCollectionViewCell.self.className, bundle: nil)
            .instantiate(withOwner: nil, options: nil).first as! ItemsCollectionViewCell
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.register(with: ItemCollectionViewCell.self)
    }
}

extension ItemsCollectionViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(with: ItemCollectionViewCell.self, for: indexPath)
            .set(number: indexPath.row)
            .setCorner()
        return cell
    }
}

extension ItemsCollectionViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width - 21) / 3
        return CGSize(width: width, height: width)
    }
}
