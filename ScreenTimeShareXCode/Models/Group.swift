//
//  Group.swift
//  ScreenTimeShareXCode
//
//  Created by Blake Marcotte on 10/21/25.
//

import Foundation
import FirebaseFirestore

struct Group: Codable, Identifiable {
    @DocumentID var id: String?
    var name: String
    var createdBy: String
    var memberIds: [String]
    var createdAt: Date
    var competitionType: CompetitionType

    enum CompetitionType: String, Codable {
        case daily
        case weekly
        case monthly
    }

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case createdBy
        case memberIds
        case createdAt
        case competitionType
    }
}
