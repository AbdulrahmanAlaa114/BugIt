//
//  BugItApp.swift
//  BugIt
//
//  Created by Abdulrahman Alaa on 06/09/2024.
//

import SwiftUI
import FirebaseCore
import GoogleSignIn

@main
struct BugItApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    var body: some Scene {
        WindowGroup {
            BugReportView()
        }
    }
}


class AppDelegate: NSObject, UIApplicationDelegate {
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
    
    func application(_ application: UIApplication,
                     open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
        var handled = GIDSignIn.sharedInstance.handle(url)
        if handled { return true }
        return false
    }
    
    func application(_ app: UIApplication, open url: URL,
                     options: [UIApplication.OpenURLOptionsKey : Any]) -> Bool {
        var handled = GIDSignIn.sharedInstance.handle(url)
        if handled { return true }
        return false
    }
}
