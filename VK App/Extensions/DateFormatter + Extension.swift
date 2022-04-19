//
//  DateFormatter + Extension.swift
//  VK App
//
//  Created by Микаэл Мартиросян on 12.04.2022.
//

import Foundation

extension DateFormatter {
    /// Custom summary: set up custom date format (ex.: 1 January, 00:00)
    var dateFormatter: DateFormatter {
        get {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "d MMMM, HH:mm"
            return dateFormatter
        }
    }
    
    /// Custom summary: convert date from Double type to String
    static func getStringDate(date: Double) -> String {
        let date = Date(timeIntervalSince1970: date)
        let stringDate = DateFormatter().dateFormatter.string(from: date)
        return stringDate
    }
}
