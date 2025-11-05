//
//  ScreenTimeViewModel.swift
//  ScreenTimeShareXCode
//
//  Created by Blake Marcotte on 10/21/25.
//

import Foundation
import FamilyControls
import DeviceActivity

@MainActor
class ScreenTimeViewModel: ObservableObject {
    @Published var todayScreenTime: TimeInterval = 0
    @Published var topApps: [AppUsage] = []
    @Published var isAuthorized = false

    private let screenTimeService = ScreenTimeService()

    init() {
        checkAuthorization()
    }

    func checkAuthorization() {
        Task {
            do {
                try await AuthorizationCenter.shared.requestAuthorization(for: .individual)
                self.isAuthorized = true
                await fetchTodayScreenTime()
            } catch {
                print("Failed to get Screen Time authorization: \(error)")
                self.isAuthorized = false
            }
        }
    }

    func fetchTodayScreenTime() async {
        // TODO: Implement screen time fetching
        // This will use DeviceActivityReport to get data
    }

    func syncScreenTimeToFirebase() async {
        // TODO: Upload screen time data to Firebase
    }
}
