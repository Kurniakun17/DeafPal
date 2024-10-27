//
//  MessageRepository.swift
//  DeafPal
//
//  Created by Kurnia Kharisma Agung Samiadjie on 26/10/24.
//

import Foundation
import SwiftData

protocol MessagesRecordRepositoryProtocol {
    func fetchMessagesRecord() -> [MessagesRecord]
    func addMessagesRecord(_ messagesRecord: MessagesRecord)
    func deleteMessagesRecord(_ messagesRecord: MessagesRecord)
    func updateMessagesRecord(_ messagesRecord: MessagesRecord)
}

final class MessagesRecordRepository: MessagesRecordRepositoryProtocol {
    private let modelContext: ModelContext

    init(modelContext: ModelContext = SwiftDataService.shared.modelContext) {
        self.modelContext = modelContext
    }

    func fetchMessagesRecord() -> [MessagesRecord] {
        do {
            return try modelContext.fetch(FetchDescriptor<MessagesRecord>())
        } catch {
            print("Failed to fetch messages: \(error.localizedDescription)")
            return []
        }
    }

    func addMessagesRecord(_ messagesRecord: MessagesRecord) {
        modelContext.insert(messagesRecord)
        saveContext()
    }

    func updateMessagesRecord(_ messagesRecord: MessagesRecord) {
        saveContext()
    }

    func deleteMessagesRecord(_ messagesRecord: MessagesRecord) {
        modelContext.delete(messagesRecord)
        saveContext()
    }

    private func saveContext() {
        do {
            try modelContext.save()
        } catch {
            print("Failed to save context: \(error.localizedDescription)")
        }
    }
}
