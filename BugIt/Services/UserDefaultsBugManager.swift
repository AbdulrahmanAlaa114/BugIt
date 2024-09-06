//
//  UserDefaultsBugManager.swift
//  MobilyTask
//
//  Created by Abdulrahman Alaa on 06/09/2024.
//

import Foundation


class UserDefaultsBugManager: BugStorageManager {
    
    private let userDefaults = UserDefaults.init(suiteName: "group.BugIt")
    private let bugsKey = "savedBugs"
    
    func saveBug(_ bug: Bug) throws {
        var savedBugs = loadBugs()
        savedBugs.append(bug)
        let encodedBugs = try JSONEncoder().encode(savedBugs)
        userDefaults?.set(encodedBugs, forKey: bugsKey)
    }
    
    func loadBugs() -> [Bug] {
        guard let data = userDefaults?.data(forKey: bugsKey),
              let bugs = try? JSONDecoder().decode([Bug].self, from: data) else {
            return []
        }
        return bugs
    }
    
    func deleteAll() throws {
        userDefaults?.set([], forKey: bugsKey)
    }
}

