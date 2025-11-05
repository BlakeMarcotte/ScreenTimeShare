//
//  GroupsView.swift
//  ScreenTimeShareXCode
//
//  Created by Blake Marcotte on 10/21/25.
//

import SwiftUI

struct GroupsView: View {
    var body: some View {
        NavigationView {
            List {
                Section {
                    Button(action: {
                        // TODO: Create new group
                    }) {
                        Label("Create New Group", systemImage: "plus.circle.fill")
                    }
                }

                Section("My Groups") {
                    ForEach(0..<3) { _ in
                        NavigationLink(destination: GroupDetailView()) {
                            HStack {
                                Image(systemName: "person.3.fill")
                                    .foregroundColor(.blue)
                                    .frame(width: 40)

                                VStack(alignment: .leading) {
                                    Text("Group Name")
                                        .fontWeight(.medium)
                                    Text("5 members")
                                        .font(.caption)
                                        .foregroundColor(.secondary)
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle("Groups")
        }
    }
}

#Preview {
    GroupsView()
}
