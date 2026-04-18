//
//  ContentView.swift
//  firebase_demo_app
//
//  Created by Dave Mandi on 4/18/26.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = SignInViewmodel()
    
    var body: some View {
        Group {
            if let user = viewModel.user {
                // If a user exists in the ViewModel, show Home
                HomeView(user: user, signOut: viewModel.signOut)
            } else {
                // Otherwise, show Login
                LoginView(viewModel: viewModel)
            }
        }
        // Smoothly animate the transition between Login and Home
        .animation(.easeInOut, value: viewModel.user != nil)
    }
}

#Preview {
    ContentView()
}
