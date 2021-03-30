//
//  CarouselViewController.swift
//  CarouselPractice
//
//  Created by yaiwamoto on 2021/03/27.
//

import UIKit

class CarouselViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.register(with: ItemsCollectionViewCell.self)
        collectionView.register(with: ItemCollectionViewCell.self)
        collectionView.register(reusableViewType: ItemsCollectionHeaderView.self)
    }
}

extension CarouselViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return Section.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let section = Section(rawValue: section) else { return 0 }
        return section.items
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let section = Section(rawValue: indexPath.section) else { return UICollectionViewCell() }
        
        switch section {
        case .carousel:
            let cell = collectionView.dequeueReusableCell(with: ItemsCollectionViewCell.self, for: indexPath)
            if let layout = cell.collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
                layout.scrollDirection = .horizontal
            }
            cell.collectionView.bounds.size.width = collectionView.frame.width - 20
            return cell
        case .grid:
            let cell = collectionView.dequeueReusableCell(with: ItemCollectionViewCell.self, for: indexPath)
                .setCorner()
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let section = Section(rawValue: indexPath.section) else { return UICollectionReusableView() }
        let cell = collectionView.dequeueReusableView(with: ItemsCollectionHeaderView.self, for: indexPath)
            .set(title: section.headerTitle)
        return cell
    }
}

extension CarouselViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard let section = Section(rawValue: indexPath.section) else { return .zero }

        switch section {
        case .carousel:
            return CGSize(width: collectionView.bounds.width - 20, height: 170)
        case .grid:
            let width = (collectionView.bounds.width - 41) / 3
            let size = CGSize(width: width, height: width)
            return size
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }
}
