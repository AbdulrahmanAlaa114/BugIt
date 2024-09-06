//
//  BugReportView.swift
//  BugIt
//
//  Created by Abdulrahman Alaa on 06/09/2024.
//

import SwiftUI


struct BugReportView: View {
    @StateObject private var viewModel = BugReportViewModel()
    @FocusState private var isDescriptionFieldFocused: Bool

    var body: some View {
        NavigationView {
            ZStack {
                Form {
                    Section(header: Text("Bug Details")) {
                        descriptionTextField
                        selectImageButton
                        imagePreview
                    }
                    
                    submitButton
                }
                .navigationTitle("Bug Tracker")
                .onAppear { viewModel.onAppear() }
                .sheet(isPresented: $viewModel.showingImagePicker) {
                    ImagePicker(image: $viewModel.inputImage)
                }
                .alert(isPresented: $viewModel.showingAlert) {
                    Alert(title: Text(viewModel.alertTitle), message: Text(viewModel.alertMessage), dismissButton: .default(Text("OK")))
                }
                
                if viewModel.isLoading {
                    loadingOverlay
                }
            }
        }
    }
    
    private var descriptionTextField: some View {
        TextField("Enter a description", text: $viewModel.description)
            .focused($isDescriptionFieldFocused)
            .padding(.vertical, 6)
    }
    
    private var selectImageButton: some View {
        Button(action: {
            isDescriptionFieldFocused = false
            viewModel.showingImagePicker = true
        }) {
            HStack {
                Image(systemName: "photo")
                    .foregroundColor(.blue)
                Text("Select Screenshot")
                    .fontWeight(.medium)
            }
        }
        .padding(.vertical, 6)
    }
    
    private var imagePreview: some View {
        Group {
            if let inputImage = viewModel.inputImage {
                HStack {
                    Spacer()
                    Image(uiImage: inputImage)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                    Spacer()
                }
                .padding(.top, 10)
            }
        }
    }
    
    private var submitButton: some View {
        Button(action: {
            isDescriptionFieldFocused = false
            viewModel.submitBug()
        }) {
            Text("Submit Bug Report")
                .frame(maxWidth: .infinity)
                .padding()
                .background(viewModel.isSubmitButtonDisabled ? Color.gray : Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
                .font(.headline)
        }
        .disabled(viewModel.isSubmitButtonDisabled)
    }
    
    private var loadingOverlay: some View {
        ZStack {
            Color.black.opacity(0.3)
                .edgesIgnoringSafeArea(.all)
            DotLoader()
        }
    }
}

#Preview {
    BugReportView()
}

