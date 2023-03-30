//
//  UIXViewCell + Extension.swift
//  VK App
//
//  Created by Микаэл Мартиросян on 24.05.2022.
//

import UIKit

protocol Reusable {}

extension UITableViewCell: Reusable {}

//extension Reusable where Self: UITableViewCell {
//    static var reuseID: String {
//        return String(describing: self)
//    }
//}


extension UICollectionViewCell: Reusable {}

//extension Reusable where Self: UICollectionViewCell {
//    static var reuseID: String {
//        return String(describing: self)
//    }
//}

extension Reusable where Self: UIView {
    static var reuseID: String {
        return String(describing: self)
    }
}
