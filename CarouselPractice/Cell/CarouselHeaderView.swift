//
//  CarouselHeaderView.swift
//  CarouselPractice
//
//  Created by yaiwamoto on 2021/03/27.
//

import UIKit

class CarouselHeaderView: UICollectionReusableView {

    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func set(title: String) -> Self {
        titleLabel.text = title
        return self
    }
}
