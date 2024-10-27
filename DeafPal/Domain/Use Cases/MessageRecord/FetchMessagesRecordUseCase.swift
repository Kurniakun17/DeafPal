//
//  FetchMessagesRecordData.swift
//  DeafPal
//
//  Created by Kurnia Kharisma Agung Samiadjie on 27/10/24.
//

import Foundation

class FetchMessagesRecordUseCase {
    private let repository: MessagesRecordRepositoryProtocol

    init(repository: MessagesRecordRepositoryProtocol) {
        self.repository = repository
    }

    func execute() -> [MessagesRecord] {
        return repository.fetchMessagesRecord()
    }
}
