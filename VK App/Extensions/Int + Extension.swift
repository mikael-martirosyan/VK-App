//
//  Int + Extension.swift
//  VK App
//
//  Created by Микаэл Мартиросян on 17.04.2022.
//

import Foundation

extension Int {
    /// Custom summary: Rounding numbers of views and return String
    func roundAndConvert() -> String {
        switch self {
        case 1000...999999:
            let result = self / 1000
            return String(result) + "K"
        case 1000000...999999999:
            let result = self / 1000000
            return String(result) + "M"
        case 1000000000...1000000000000:
            let result = self / 1000000000
            return String(result) + "B"
        default:
            return String(self)
        }
    }
}
