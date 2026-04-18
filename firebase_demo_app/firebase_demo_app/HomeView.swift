//
//  HomeView.swift
//  firebase_demo_app
//
//  Created by Dave Mandi on 4/18/26.
//


import SwiftUI
import FirebaseAuth

struct HomeView: View {
    let user: User
    let signOut: () -> Void
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 12) {
                List {
                    NavigationLink("Feature A") { FeatureAView() }
                    NavigationLink("Feature B") { FeatureBView() }
                }
                .listStyle(.insetGrouped)
                
                Spacer(minLength: 0)
                
                HStack {
                    Text("Signed in as: \(user.email ?? "Unknown User")")
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                        .lineLimit(1)
                        .minimumScaleFactor(0.6)
                        .truncationMode(.middle)
                    
                    Spacer()
                    
                    Button("Log Out", role: .destructive) {
                        signOut()
                    }
                    .buttonStyle(.bordered)
                }
                .padding(.horizontal)
                .padding(.bottom)
            }
            .navigationTitle("Home")
        }
    }
}

struct FeatureAView: View {
    var body: some View {
        Text("Feature A Screen").font(.title).navigationTitle("Feature A")
    }
}

struct FeatureBView: View {
    var body: some View {
        Text("Feature B Screen").font(.title).navigationTitle("Feature B")
    }
}
