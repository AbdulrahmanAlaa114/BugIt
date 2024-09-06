//
//  BugStorageManagerFactory.swift
//  BugIt
//
//  Created by Abdulrahman Alaa on 15/09/2024.
//

import Foundation

class BugStorageManagerFactory {
    static func createBugStorageManager() -> BugStorageManager {
        if #available(iOS 17.0, *) {
            return SwiftDataBugManager()
        } else {
            return UserDefaultsBugManager()
        }
    }
}
