//
//  CarouselItemCollectionViewCell.swift
//  CarouselPractice
//
//  Created by yaiwamoto on 2021/03/27.
//

import UIKit

class CarouselItemCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var numberLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func set(number: Int) -> Self {
        numberLabel.text = "\(number)"
        
        return self
    }
    
    func setCorner() -> Self {
        self.layer.cornerRadius = 12
        self.layer.shadowOpacity = 0.4
        self.layer.borderColor = UIColor.gray.cgColor
        self.layer.borderWidth = 2
        self.layer.shadowRadius = 12
        
        return self
    }
}
