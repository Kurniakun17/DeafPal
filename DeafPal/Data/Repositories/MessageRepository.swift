//
//  MessageRepository.swift
//  DeafPal
//
//  Created by Kurnia Kharisma Agung Samiadjie on 26/10/24.
//

import Foundation
import SwiftData

protocol MessageRepositoryProtocol {
    func fetchMessages() -> [Message]
    func addMessage(_ message: Message)
    func deleteMessage(_ message: Message)
}

final class MessageRepository: MessageRepositoryProtocol {
    private let modelContext: ModelContext

    init(modelContext: ModelContext = SwiftDataService.shared.modelContext) {
        self.modelContext = modelContext
    }

    func fetchMessages() -> [Message] {
        do {
            return try modelContext.fetch(FetchDescriptor<Message>())
        } catch {
            print("Failed to fetch messages: \(error.localizedDescription)")
            return []
        }
    }

    func addMessage(_ message: Message) {
        modelContext.insert(message)
        saveContext()
    }

    func deleteMessage(_ message: Message) {
        modelContext.delete(message)
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
