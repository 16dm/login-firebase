//
//  SignInViewmodel.swift
//  firebase_demo_app
//
//  Created by Dave Mandi on 4/18/26.
//


import Foundation
import FirebaseAuth
import Firebase
import Combine

class SignInViewmodel: ObservableObject {
    @Published var user: User?
    @Published var errorMessage: String?
    
    private var authStateHandle: AuthStateDidChangeListenerHandle?
    
    init() {
        // Automatically updates 'user' when the login state changes
        authStateHandle = Auth.auth().addStateDidChangeListener { [weak self] _, user in
            self?.user = user
        }
    }
    
    deinit {
        if let handle = authStateHandle {
            Auth.auth().removeStateDidChangeListener(handle)
        }
    }
    
    func signIn(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] result, error in
            if let error = error {
                self?.errorMessage = error.localizedDescription
                return
            }
            self?.user = result?.user
        }
    }
    
    func signUp(email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            if let error = error {
                self?.errorMessage = error.localizedDescription
                return
            }
            self?.user = result?.user
        }
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
            self.user = nil
        } catch {
            self.errorMessage = error.localizedDescription
        }
    }
}
