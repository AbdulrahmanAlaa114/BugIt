//
//  FirebaseStorageService.swift
//  BugIt
//
//  Created by Abdulrahman Alaa on 06/09/2024.
//

import Foundation
import FirebaseStorage

class FirebaseStorageService: StorageService {
    func uploadImage(imageData: Data) async throws -> URL {
        let meta = StorageMetadata()
        meta.contentType = "image/jpeg"
        let ref = Storage.storage().reference(withPath: "\(UUID().uuidString).jpg")
        return try await save(data: imageData, reference: ref, meta: meta)
    }
    
    private func save(data: Data, reference: StorageReference, meta: StorageMetadata) async throws -> URL {
        let _ = try await reference.putDataAsync(data, metadata: meta)
        return try await reference.downloadURL()
    }
    
    enum FirebaseStorageError: Error {
        case unableToConvertToData
    }
}
