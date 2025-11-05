//
//  LeaderboardView.swift
//  ScreenTimeShareXCode
//
//  Created by Blake Marcotte on 10/21/25.
//

import SwiftUI

struct LeaderboardView: View {
    var body: some View {
        NavigationView {
            List {
                ForEach(0..<10) { index in
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
                            Text("Group Name")
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }

                        Spacer()

                        VStack(alignment: .trailing) {
                            Text("2h 30m")
                                .fontWeight(.semibold)
                            Text("today")
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                    }
                    .padding(.vertical, 4)
                }
            }
            .navigationTitle("Leaderboard")
        }
    }
}

#Preview {
    LeaderboardView()
}
