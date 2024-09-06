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
    
    init() {
        if #available(iOS 17.0, *) {
            bugStorageManager = SwiftDataBugManager()
        } else {
            bugStorageManager = UserDefaultsBugManager()
        }
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
