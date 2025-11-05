//
//  User.swift
//  ScreenTimeShareXCode
//
//  Created by Blake Marcotte on 10/21/25.
//

import Foundation
import FirebaseFirestore

struct User: Codable, Identifiable {
    @DocumentID var id: String?
    var username: String
    var email: String
    var createdAt: Date
    var friendIds: [String]
    var groupIds: [String]

    enum CodingKeys: String, CodingKey {
        case id
        case username
        case email
        case createdAt
        case friendIds
        case groupIds
    }
}
