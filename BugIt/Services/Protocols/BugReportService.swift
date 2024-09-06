//
//  BugReportService.swift
//  BugIt
//
//  Created by Abdulrahman Alaa on 06/09/2024.
//

import Foundation

// Protocol that defines a generic service for handling bug reports
protocol BugReportService {
    func submitBugReport(description: String, imageURL: String) async throws
}
