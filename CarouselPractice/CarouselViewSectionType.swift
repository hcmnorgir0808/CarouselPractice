//
//  CarouselViewSectionType.swift
//  CarouselPractice
//
//  Created by yaiwamoto on 2021/03/27.
//

import Foundation

enum Section: Int, CaseIterable {
    case carousel
    case grid
    
    var items: Int {
        switch self {
        case .carousel: return 1
        case .grid: return 1
        }
    }
    
    var title: String {
        switch self {
        case .carousel: return "カルーセル"
        case .grid: return "グリッド"
        }
    }
}
