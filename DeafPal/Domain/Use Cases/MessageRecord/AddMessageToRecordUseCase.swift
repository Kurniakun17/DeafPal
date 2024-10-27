//
//  AddMessageToRecordUseCase.swift
//  DeafPal
//
//  Created by Kurnia Kharisma Agung Samiadjie on 27/10/24.
//

import Foundation

class AddMessageToRecordUseCase {
    private let repository: MessagesRecordRepositoryProtocol

    init(repository: MessagesRecordRepositoryProtocol) {
        self.repository = repository
    }

    func execute(messagesRecord: MessagesRecord, message: Message) {
        messagesRecord.messages.append(message)
        repository.updateMessagesRecord(messagesRecord)
    }
}
