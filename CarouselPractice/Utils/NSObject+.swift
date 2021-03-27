//
//  NSObject+.swift
//  CarouselPractice
//
//  Created by yaiwamoto on 2021/03/27.
//

import Foundation

extension NSObject {
    class var className: String {
        return String(describing: self)
    }
}
