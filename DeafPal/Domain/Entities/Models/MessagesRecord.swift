//
//  CommunicationRecords.swift
//  DeafPal
//
//  Created by Kurnia Kharisma Agung Samiadjie on 27/10/24.
//

import Foundation
import SwiftData

@Model
class MessagesRecord: Identifiable {
    var id: UUID
    var title: String
    var messages: [Message]
    var date: Date

    init(id: UUID = .init(), title: String, messages: [Message] = [], date: Date) {
        self.id = id
        self.title = title
        self.messages = messages
        self.date = date
    }
}
