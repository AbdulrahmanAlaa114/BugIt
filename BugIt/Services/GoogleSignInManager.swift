//
//  GoogleSignInManager.swift
//  BugIt
//
//  Created by Abdulrahman Alaa on 06/09/2024.
//

import UIKit
import GoogleSignIn

@MainActor
class GoogleSignInManager {
    
    var isSignedIn = false

    func signIn(presenting viewController: UIViewController) async {
        do {
            // Attempt to restore previous sign-in
            _ = try await GIDSignIn.sharedInstance.restorePreviousSignIn()
            isSignedIn = true
        } catch {
            do {
                _ = try await GIDSignIn.sharedInstance.signIn(withPresenting: viewController, hint: nil, additionalScopes: Constants.additionalScopes)
                isSignedIn = true
            } catch {
                print("Error with signing in: \(error.localizedDescription)")
                isSignedIn = false
            }
        }
    }

    func signOut() {
        GIDSignIn.sharedInstance.signOut()
        isSignedIn = false
    }
}
