//
//  StorageService.swift
//  BugIt
//
//  Created by Abdulrahman Alaa on 06/09/2024.
//

import Foundation

// Example implementation of StorageService protocol
protocol StorageService {
    func uploadImage(imageData: Data) async throws -> URL
}

