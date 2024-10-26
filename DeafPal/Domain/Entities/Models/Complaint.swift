//
//  ComplaintEntities.swift
//  DeafPal
//
//  Created by Kurnia Kharisma Agung Samiadjie on 25/10/24.
//

import Foundation
import SwiftData

@Model
class Complaint: Identifiable, Hashable {
    var id: UUID
    var title: String
    var summary: [String]
    var date: Date

    init(id: UUID = .init(), title: String = "", summary: [String] = [], date: Date = .now) {
        self.id = id
        self.title = title
        self.summary = summary
        self.date = date
    }
}
