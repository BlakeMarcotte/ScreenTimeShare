//
//  DashboardView.swift
//  ScreenTimeShareXCode
//
//  Created by Blake Marcotte on 10/21/25.
//

import SwiftUI

struct DashboardView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    Text("Today's Screen Time")
                        .font(.title2)
                        .fontWeight(.bold)

                    // Screen time card
                    VStack(spacing: 10) {
                        Text("0h 0m")
                            .font(.system(size: 48, weight: .bold))

                        Text("Total Screen Time")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue.opacity(0.1))
                    .cornerRadius(15)

                    // Quick stats
                    Text("Top Apps")
                        .font(.title3)
                        .fontWeight(.semibold)

                    VStack(spacing: 12) {
                        ForEach(0..<3) { _ in
                            HStack {
                                Circle()
                                    .fill(Color.gray.opacity(0.3))
                                    .frame(width: 40, height: 40)

                                VStack(alignment: .leading) {
                                    Text("App Name")
                                        .fontWeight(.medium)
                                    Text("0m")
                                        .font(.caption)
                                        .foregroundColor(.secondary)
                                }

                                Spacer()
                            }
                            .padding()
                            .background(Color.gray.opacity(0.05))
                            .cornerRadius(10)
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("Dashboard")
        }
    }
}

#Preview {
    DashboardView()
}
