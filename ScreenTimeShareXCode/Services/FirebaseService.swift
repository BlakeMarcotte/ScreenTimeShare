//
//  FirebaseService.swift
//  ScreenTimeShareXCode
//
//  Created by Blake Marcotte on 10/21/25.
//

import Foundation
import FirebaseFirestore

class FirebaseService {
    private let db = Firestore.firestore()

    // MARK: - User Operations
    func createUser(_ user: User) async throws {
        guard let userId = user.id else { return }
        try db.collection("users").document(userId).setData(from: user)
    }

    func fetchUser(userId: String) async throws -> User? {
        let document = try await db.collection("users").document(userId).getDocument()
        return try document.data(as: User.self)
    }

    // MARK: - Group Operations
    func createGroup(_ group: Group) async throws -> String {
        let docRef = try db.collection("groups").addDocument(from: group)
        return docRef.documentID
    }

    func fetchGroups(for userId: String) async throws -> [Group] {
        let snapshot = try await db.collection("groups")
            .whereField("memberIds", arrayContains: userId)
            .getDocuments()

        return try snapshot.documents.compactMap { try $0.data(as: Group.self) }
    }

    func addMemberToGroup(groupId: String, userId: String) async throws {
        try await db.collection("groups").document(groupId).updateData([
            "memberIds": FieldValue.arrayUnion([userId])
        ])
    }

    // MARK: - Screen Time Data Operations
    func saveScreenTimeData(_ data: ScreenTimeData) async throws {
        try db.collection("screenTimeData").addDocument(from: data)
    }

    func fetchScreenTimeData(userId: String, date: Date) async throws -> ScreenTimeData? {
        let calendar = Calendar.current
        let startOfDay = calendar.startOfDay(for: date)
        let endOfDay = calendar.date(byAdding: .day, value: 1, to: startOfDay)!

        let snapshot = try await db.collection("screenTimeData")
            .whereField("userId", isEqualTo: userId)
            .whereField("date", isGreaterThanOrEqualTo: startOfDay)
            .whereField("date", isLessThan: endOfDay)
            .limit(to: 1)
            .getDocuments()

        return try snapshot.documents.first?.data(as: ScreenTimeData.self)
    }

    func fetchLeaderboard(groupId: String, startDate: Date, endDate: Date) async throws -> [(User, TimeInterval)] {
        // TODO: Implement leaderboard query
        // This will aggregate screen time data for all group members
        return []
    }
}
