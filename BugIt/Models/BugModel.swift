//
//  BugModel.swift
//  BugIt
//
//  Created by Abdulrahman Alaa on 06/09/2024.
//

import Foundation
import SwiftData

@Model
class BugModel {
    @Attribute(.externalStorage)
    var imageData: Data
    
    var desc: String = ""
    
    init(imageData: Data, description: String) {
        self.imageData = imageData
        self.desc = description
    }
}
