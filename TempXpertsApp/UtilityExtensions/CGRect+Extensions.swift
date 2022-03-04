//
//  CGRect+Extensions.swift
//  TempXpertsApp
//
//  Created by Sriram S on 04/03/22.
//


import Foundation
import UIKit
import SDWebImage

extension CGRect {
    var rightBottom: CGPoint {
        get {
            return CGPoint(x: origin.x + width, y: origin.y + height)
        }
    }
    var center: CGPoint {
        get {
            return origin.plus(rightBottom).mul(0.5)
        }
    }
}
