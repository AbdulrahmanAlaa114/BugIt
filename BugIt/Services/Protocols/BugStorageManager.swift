//
//  BugStorageManager.swift
//  MobilyTask
//
//  Created by Abdulrahman Alaa on 06/09/2024.
//

import Foundation

protocol BugStorageManager {
    func saveBug(_ bug: Bug) throws
    func loadBugs() async throws -> [Bug]
    func deleteAll() throws
}
