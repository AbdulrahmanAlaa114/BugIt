//
//  ShareViewController.swift
//  Share
//
//  Created by Abdulrahman Alaa on 06/09/2024.
//

import UIKit
import Social
import SwiftUI

class ShareViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        isModalInPresentation = true
        if let itemsProviders = (extensionContext?.inputItems.first as? NSExtensionItem)?.attachments {
            let hostView = UIHostingController(rootView: ShareView(itemsProviders: itemsProviders, extensionContext: extensionContext))
            hostView.view.frame = view.frame
            view.addSubview(hostView.view)
        }
    }
    
}

struct ShareView: View {
    var itemsProviders: [NSItemProvider]
    var extensionContext: NSExtensionContext?
        
    @StateObject private var viewModel = ShareViewModel()
    @FocusState private var isDescriptionFieldFocused: Bool
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                VStack {
                    headerView
                    descriptionTextField
                    imagePreview
                    actionButtons
                    Spacer()
                }
                .padding()
                .onAppear {
                    extractItem(size: geometry.size)
                }
            }
        }
    }
    
    // Header view with title and cancel button
    private var headerView: some View {
        HStack {
            Text("BugIt")
                .font(.title2)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .leading)
            Button(action: dismiss) {
                Text("Cancel")
                    .foregroundColor(.blue)
            }
        }
        .padding(.bottom, 16)
    }
    
    // TextField for entering description
    private var descriptionTextField: some View {
        TextField("Enter a description (optional)", text: $viewModel.description)
            .focused($isDescriptionFieldFocused)
            .padding(.vertical, 8)
    }
    
    // Image preview with resizing
    @ViewBuilder
    private var imagePreview: some View {
        if let image = viewModel.inputImage {
            Image(uiImage: image)
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity)
                .frame(height: 300)
                .padding(.bottom, 16)
        }
    }
    
    
    // Save and cancel buttons
    private var actionButtons: some View {
        HStack {
            Button {
                viewModel.save()
                dismiss()
            } label: {
                Text("Send To App")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .font(.headline)
            }


        }
    }
    
    func extractItem(size: CGSize) {
        guard !itemsProviders.isEmpty else { return }
        DispatchQueue.global(qos: .userInteractive).async {
            if let item = itemsProviders.last {
                _ = item.loadDataRepresentation(for: .image) { data, error in
                    if let data , let image = UIImage(data: data), let thumbnail = image.preparingThumbnail(of: .init(width: size.width, height: 300)) {
                        DispatchQueue.main.async {
                            viewModel.inputImage = thumbnail
                        }
                    }
                }
            }
        }
    }
    
    // Dismiss the extension context
    private func dismiss() {
        extensionContext?.completeRequest(returningItems: [])
    }
}
