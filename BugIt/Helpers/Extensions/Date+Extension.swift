//
//  Date+Extension.swift
//  BugIt
//
//  Created by Abdulrahman Alaa on 06/09/2024.
//

import Foundation

extension Date {
    func getCurrentDateFormatted(dateFormat: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        return dateFormatter.string(from: self)
    }
}
