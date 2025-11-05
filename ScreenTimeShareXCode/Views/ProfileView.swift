//
//  ProfileView.swift
//  ScreenTimeShareXCode
//
//  Created by Blake Marcotte on 10/21/25.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        NavigationView {
            List {
                Section {
                    HStack {
                        Circle()
                            .fill(Color.gray.opacity(0.3))
                            .frame(width: 60, height: 60)

                        VStack(alignment: .leading) {
                            Text("User Name")
                                .font(.title3)
                                .fontWeight(.semibold)
                            Text("user@example.com")
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                        .padding(.leading, 10)
                    }
                    .padding(.vertical, 10)
                }

                Section("Settings") {
                    NavigationLink(destination: Text("Notifications")) {
                        Label("Notifications", systemImage: "bell.fill")
                    }

                    NavigationLink(destination: Text("Privacy")) {
                        Label("Privacy", systemImage: "lock.fill")
                    }

                    NavigationLink(destination: Text("Screen Time Access")) {
                        Label("Screen Time Access", systemImage: "hourglass")
                    }
                }

                Section {
                    Button(action: {
                        // TODO: Sign out
                    }) {
                        Text("Sign Out")
                            .foregroundColor(.red)
                    }
                }
            }
            .navigationTitle("Profile")
        }
    }
}

#Preview {
    ProfileView()
}
