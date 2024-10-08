//
//  SwiftDataBugManager.swift
//  MobilyTask
//
//  Created by Abdulrahman Alaa on 06/09/2024.
//

import Foundation
import SwiftData

@available(iOS 17.0, *)
class SwiftDataBugManager: BugStorageManager {
    
    private var context: ModelContext
    
    init() {
        self.context = try! ModelContext(.init(for: BugModel.self))
    }

    func saveBug(_ bug: Bug) throws {
        let bugModel = BugModel(imageData: bug.imageData, description: bug.description)
        context.insert(bugModel)
        try context.save()
    }
    
    func loadBugs() async throws -> [Bug] {
        let fetchDescriptor = FetchDescriptor<BugModel>()
        let bugs = try context.fetch(fetchDescriptor)
        return bugs.map { Bug(description: $0.desc, imageData: $0.imageData) }
    }

    func deleteAll() throws {
        try context.delete(model: BugModel.self)
    }
}
