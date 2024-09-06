# Bug It - Bug Tracking iOS Application

<p align="center">
  <img src="Images/appstore.png" alt="Screenshot" width="150"/>
</p>

<p align="center" style="display: flex; gap: 10px;">
<img src="Images/screen1.gif" width="375" height="812" />
<img src="Images/screen2.gif" width="375" height="812" />
</p>

## Overview

**Bug It** is an iOS application developed using Swift and SwiftUI for tracking and managing bugs. The app allows users to capture screenshots and provide descriptions for bug reports. These reports are then stored in Google Sheets and can also receive images from other apps for bug creation.

## Features

- **Data Management**: Utilizes SwiftData or UserDefaults for storing bug data, depending on iOS version.
- **User-Friendly Interface**: Designed with SwiftUI for a smooth and visually appealing user experience.
- **Bug Submission**: Users can capture screenshots or select images from their device's gallery and provide descriptions.
- **Data Storage**: Bug reports are stored in Google Sheets. Each day has its own sheet/tab for organization.
- **Image Handling**: Supports receiving images from other apps to create bug reports.
- **Share Extension**: Allows sharing bug-related data from other apps directly into the Bug It app.

## Requirements

**Functionality**:
   - Capture or select images for bug reports.
   - Upload bug data to Google Sheets with daily tabs.
   - Integrate with third-party systems for image uploads.
   - Receive images from other apps for bug creation.


## Architecture

### MVVM Design Pattern

The application follows the Model-View-ViewModel (MVVM) architecture pattern to ensure a clean separation of concerns:

- **Model**: Represents the data and business logic (e.g., `BugModel`, `Bug`).
- **View**: Defines the user interface using SwiftUI (e.g., `BugReportView`, `ShareView`).
- **ViewModel**: Manages the data for the view and handles user actions (e.g., `BugReportViewModel`, `ShareViewModel`).

This architecture helps in maintaining a scalable and testable codebase.


## Installation

1. Clone the repository:
    ```bash
    git clone https://github.com/AbdulrahmanAlaa114/BugIt.git
    ```
2. Open the project in Xcode:
    ```bash
    open BugIt.xcodeproj
    ```
3. Build and run the application.

## Contributing

Feel free to open issues or submit pull requests. Please ensure your code adheres to the project's coding standards and includes appropriate tests.
