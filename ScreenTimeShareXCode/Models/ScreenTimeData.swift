//
//  ScreenTimeData.swift
//  ScreenTimeShareXCode
//
//  Created by Blake Marcotte on 10/21/25.
//

import Foundation
import FirebaseFirestore

struct ScreenTimeData: Codable, Identifiable {
    @DocumentID var id: String?
    var userId: String
    var date: Date
    var totalScreenTime: TimeInterval // in seconds
    var appUsage: [AppUsage]

    enum CodingKeys: String, CodingKey {
        case id
        case userId
        case date
        case totalScreenTime
        case appUsage
    }
}

struct AppUsage: Codable, Identifiable {
    var id = UUID()
    var appName: String
    var bundleIdentifier: String
    var duration: TimeInterval // in seconds

    enum CodingKeys: String, CodingKey {
        case appName
        case bundleIdentifier
        case duration
    }
}
