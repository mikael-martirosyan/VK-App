//
//  CGFloat + Extension.swift
//  VK App
//
//  Created by Микаэл Мартиросян on 19.04.2022.
//

import UIKit

extension CGFloat {
    /// Custom summary: change height of photo
//    static func getPhotoHeight(height: Int, width: Int, viewWidth: CGFloat) -> CGFloat {
//        return CGFloat(height) * viewWidth / CGFloat(width)
//    }
    
    static func calculateHeight(width: CGFloat) -> CGFloat {
        let ratio: CGFloat = 16 / 9
        let height = width * ratio
        return height
    }
}
