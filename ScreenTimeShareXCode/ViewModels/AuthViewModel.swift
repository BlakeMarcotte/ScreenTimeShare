//
//  AuthViewModel.swift
//  ScreenTimeShareXCode
//
//  Created by Blake Marcotte on 10/21/25.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

@MainActor
class AuthViewModel: ObservableObject {
    @Published var isAuthenticated = false
    @Published var currentUser: User?
    @Published var errorMessage: String?

    private let auth = Auth.auth()
    private let db = Firestore.firestore()

    init() {
        checkAuthStatus()
    }

    func checkAuthStatus() {
        if let firebaseUser = auth.currentUser {
            isAuthenticated = true
            fetchUserData(userId: firebaseUser.uid)
        }
    }

    func signUp(email: String, password: String, username: String) async {
        do {
            let result = try await auth.createUser(withEmail: email, password: password)

            let newUser = User(
                id: result.user.uid,
                username: username,
                email: email,
                createdAt: Date(),
                friendIds: [],
                groupIds: []
            )

            try db.collection("users").document(result.user.uid).setData(from: newUser)

            self.currentUser = newUser
            self.isAuthenticated = true
        } catch {
            self.errorMessage = error.localizedDescription
        }
    }

    func signIn(email: String, password: String) async {
        do {
            let result = try await auth.signIn(withEmail: email, password: password)
            fetchUserData(userId: result.user.uid)
            self.isAuthenticated = true
        } catch {
            self.errorMessage = error.localizedDescription
        }
    }

    func signOut() {
        do {
            try auth.signOut()
            self.isAuthenticated = false
            self.currentUser = nil
        } catch {
            self.errorMessage = error.localizedDescription
        }
    }

    private func fetchUserData(userId: String) {
        db.collection("users").document(userId).getDocument { snapshot, error in
            if let error = error {
                self.errorMessage = error.localizedDescription
                return
            }

            if let snapshot = snapshot {
                do {
                    self.currentUser = try snapshot.data(as: User.self)
                } catch {
                    self.errorMessage = error.localizedDescription
                }
            }
        }
    }
}
