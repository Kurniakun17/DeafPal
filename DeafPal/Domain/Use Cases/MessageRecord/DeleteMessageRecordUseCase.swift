//
//  DeleteMessageRecordUseCase.swift
//  DeafPal
//
//  Created by Kurnia Kharisma Agung Samiadjie on 27/10/24.
//

import Foundation

class DeleteMessageRecordUseCase {
    private let repository: MessagesRecordRepositoryProtocol

    init(repository: MessagesRecordRepositoryProtocol) {
        self.repository = repository
    }

    func execute(_ messagesRecord: MessagesRecord) {
        repository.deleteMessagesRecord(messagesRecord)
    }
}
