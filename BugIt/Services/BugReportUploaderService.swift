//
//  BugReportUploaderService.swift
//  BugIt
//
//  Created by Abdulrahman Alaa on 06/09/2024.
//

import Foundation

// Implementation of BugReportService that uses Google Sheets for reporting
class BugReportUploaderService {
  
    private let storageService: StorageService
    private let bugReportService: BugReportService
    
    init(storageService: StorageService = FirebaseStorageService(), bugReportService: BugReportService = GoogleSheetsService()) {
        self.storageService = storageService
        self.bugReportService = bugReportService
    }
    
    func submitBugReport(description: String, imageData: Data) async throws {
        let imageURL = try await storageService.uploadImage(imageData: imageData)
        try await bugReportService.submitBugReport(description: description, imageURL: imageURL.absoluteString)
    }
}



