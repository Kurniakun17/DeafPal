//
//  Message.swift
//  DeafPal
//
//  Created by Kurnia Kharisma Agung Samiadjie on 26/10/24.
//

import Foundation
import SwiftData

@Model
class Message: Identifiable, Hashable {
    var id: UUID
    var text: String
    var role: UserRole
    var date: Date

    init(id: UUID = .init(), text: String = "", role: UserRole, date: Date = .now) {
        self.id = id
        self.text = text
        self.role = role
        self.date = date
    }
}
