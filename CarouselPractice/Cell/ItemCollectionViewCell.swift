//
//  ItemCollectionViewCell.swift
//  CarouselPractice
//
//  Created by yaiwamoto on 2021/03/27.
//

import UIKit

class ItemCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var itemLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func set(number: Int) -> Self {
        itemLabel.text = "商品名"
        priceLabel.text = "価格"
        
        return self
    }
    
    func setCorner() -> Self {
        self.layer.cornerRadius = 12
        self.layer.shadowOpacity = 0.4
        self.layer.borderColor = UIColor.gray.cgColor
        self.layer.borderWidth = 1
        self.layer.shadowRadius = 12
        
        return self
    }
}
