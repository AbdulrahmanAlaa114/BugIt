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

 
    var isSubmitButtonDisabled: Bool {
        description.isEmpty || inputImage == nil
    }
    
    func onAppear() {

    }
    
    
    func submitBug() {
       
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
