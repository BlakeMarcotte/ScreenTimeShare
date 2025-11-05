//
//  GroupDetailView.swift
//  ScreenTimeShareXCode
//
//  Created by Blake Marcotte on 10/21/25.
//

import SwiftUI

struct GroupDetailView: View {
    var body: some View {
        List {
            Section("Competition") {
                VStack(alignment: .leading, spacing: 10) {
                    Text("Current Week")
                        .font(.headline)
                    Text("Ends in 3 days")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
            }

            Section("Members") {
                ForEach(0..<5) { index in
                    HStack {
                        Text("\(index + 1)")
                            .fontWeight(.bold)
                            .frame(width: 30)

                        Circle()
                            .fill(Color.gray.opacity(0.3))
                            .frame(width: 40, height: 40)

                        VStack(alignment: .leading) {
                            Text("User Name")
                                .fontWeight(.medium)
                            Text("2h 30m today")
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }

                        Spacer()
                    }
                }
            }
        }
        .navigationTitle("Group Name")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    GroupDetailView()
}
