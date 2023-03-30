//
//  DateFormatter + Extension.swift
//  VK App
//
//  Created by Микаэл Мартиросян on 12.04.2022.
//

import Foundation

extension DateFormatter {
    /// Custom summary: set up custom date format (ex.: 1 January, 00:00)
    static var dateFormatter: DateFormatter {
        get {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "d MMMM, HH:mm"
            return dateFormatter
        }
    }
    
    /// Custom summary: convert date from Double type to String
    static func getStringDate(date: Double) -> String {
        let date = Date(timeIntervalSince1970: date)
        let stringDate = DateFormatter.dateFormatter.string(from: date)
        #warning("Просмотреть видео")
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "d MMMM, HH:mm"
//        return dateFormatter
        return stringDate
    }
    
    //Пример с сайта
//    static func testDateFormatterCreationAndParseWithCache() throws {
//        let df = DateFormatter()
//
//        self.measure {
//            for _ in (0..<numberOfIterations) {
//                let date = df.date(from: "30/01/2020")
//            }
//        }
//    }
}
