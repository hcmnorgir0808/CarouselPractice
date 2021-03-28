//
//  ItemsCollectionViewCell.swift
//  CarouselPractice
//
//  Created by yaiwamoto on 2021/03/27.
//

import UIKit

class ItemsCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    
    private var section: Section?
    
    private static var cell: ItemsCollectionViewCell = {
        UINib(nibName: ItemsCollectionViewCell.self.className, bundle: nil)
            .instantiate(withOwner: nil, options: nil)[0] as! ItemsCollectionViewCell
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
    
    func set(section: Section) {
        self.section = section
    }
    
    // setメソッド実行後にlayoutIfNeededを使って描画して？layoutFittingCompressedSizeで高さを計算したい
    static func height(width: CGFloat, section: Section) -> CGFloat {
        cell.frame.size = CGSize(width: width, height: .greatestFiniteMagnitude)
        cell.set(section: section)
        
        cell.setNeedsLayout()
        cell.layoutIfNeeded()
        
        return cell.systemLayoutSizeFitting(
            UIView.layoutFittingCompressedSize,
            withHorizontalFittingPriority: .required,
            verticalFittingPriority: .fittingSizeLevel
        ).height
    }
}

extension ItemsCollectionViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 15
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
        guard let section = section else { return .zero }
        switch section {
        case .carousel: return CGSize(width: 150, height: 150)
        case .grid:
            let width = (collectionView.frame.width - 21) / 3
            return CGSize(width: width, height: width)
        }
    }
}
