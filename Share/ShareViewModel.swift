//
//  ShareViewModel.swift
//  Share
//
//  Created by Abdulrahman Alaa on 06/09/2024.
//

import UIKit

class ShareViewModel: ObservableObject {
    @Published var description: String = ""
    @Published var inputImage: UIImage? = nil
    @Published var isLoading: Bool = false

    var bugStorageManager: BugStorageManager
    
    init(bugStorageManager: BugStorageManager = BugStorageManagerFactory.createBugStorageManager() ) {
        self.bugStorageManager = bugStorageManager
    }
    
    func save() {
        if let inputImage = inputImage, let imageData = inputImage.jpegData(compressionQuality: 1) {
            do {
                try bugStorageManager.saveBug(Bug(description: description, imageData: imageData))
            } catch {
                print(error)
            }
        }
    }
}
