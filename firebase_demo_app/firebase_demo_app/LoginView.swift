//
//  LoginView.swift
//  firebase_demo_app
//
//  Created by Dave Mandi on 4/18/26.
//
import SwiftUI

struct LoginView: View {
    @ObservedObject var viewModel: SignInViewmodel
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        VStack(spacing: 15) {
            Text("Login with Email")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            TextField("Email", text: $email)
                .textFieldStyle(.roundedBorder)
                .textInputAutocapitalization(.never)
                .keyboardType(.emailAddress)
            
            SecureField("Password", text: $password)
                .textFieldStyle(.roundedBorder)
                .textInputAutocapitalization(.never)
            
            Button("Login") {
                viewModel.signIn(email: email, password: password)
            }
            .buttonStyle(.borderedProminent)
            .padding(.top, 8)
            
            if let errorMessage = viewModel.errorMessage {
                Text(errorMessage)
                    .foregroundStyle(Color.red)
                    .font(.caption)
                    .multilineTextAlignment(.center)
            }
            
            Button("Sign Up") {
                viewModel.signUp(email: email, password: password)
            }
            .padding(.top, 10)
        }
        .padding()
    }
}
