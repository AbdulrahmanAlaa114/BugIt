//
//  BugReportViewModel.swift
//  BugIt
//
//  Created by Abdulrahman Alaa on 06/09/2024.
//

import Foundation
import UIKit
import SwiftUI

@MainActor
class BugReportViewModel: ObservableObject {
    
    @Published var description: String = ""
    @Published var inputImage: UIImage? = nil
    @Published var showingImagePicker: Bool = false
    @Published var showingAlert: Bool = false
    @Published var alertMessage: String = ""
    @Published var alertTitle: String = ""
    @Published var isLoading: Bool = false

    let bugUploaderService: BugReportUploaderService
    let signInManager: GoogleSignInManager
    
    init(bugUploaderService: BugReportUploaderService = BugReportUploaderService()) {
        self.bugUploaderService = bugUploaderService
        self.signInManager = GoogleSignInManager()
    }
    
    var isSubmitButtonDisabled: Bool {
        description.isEmpty || inputImage == nil
    }
    
    func onAppear() {
        signIn()
    }
    
    func signIn() {
        Task {
            guard let rootViewController = UIApplication.shared.windows.first?.rootViewController else { return }
            await signInManager.signIn(presenting: rootViewController)
        }
    }
    
    func submitBug() {
        isLoading = true
        guard signInManager.isSignedIn else {
            isLoading = false
            signIn()
            return
        }
        
        guard let inputImage = inputImage, let imageData = inputImage.jpegData(compressionQuality: 0.1) else {
            isLoading = false
            showAlert(title: "Submission Error", message: "No image selected or image data could not be processed.")
            return
        }
        
        Task {
            do {
                try await bugUploaderService.submitBugReport(description: description, imageData: imageData)
                
                isLoading = false
                resetData()
                
                showAlert(title: "Submission Successful", message: "Your bug report has been successfully uploaded.")
            } catch {
                #if DEBUG
                print("Error during submission: \(error)")
                #endif
                
                isLoading = false
                showAlert(title: "Submission Failed", message: "Failed to upload bug report. Please try again.")
            }
        }
    }
    
    private func showAlert(title: String, message: String) {
        self.alertTitle = title
        self.alertMessage = message
        self.showingAlert = true
    }
    
    private func resetData() {
        self.inputImage = nil
        self.description = ""
    }
    
}
