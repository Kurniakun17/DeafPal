//
//  ComplaintRepository.swift
//  DeafPal
//
//  Created by Kurnia Kharisma Agung Samiadjie on 26/10/24.
//

import SwiftData

protocol ComplaintRepositoryProtocol {
    func fetchComplaints() -> [Complaint]
    func addComplaint(_ complaint: Complaint)
    func deleteComplaint(_ complaint: Complaint)
}

final class ComplaintRepository: ComplaintRepositoryProtocol {
    private let modelContext: ModelContext

    init(modelContext: ModelContext = SwiftDataService.shared.modelContext) {
        self.modelContext = modelContext
    }

    func fetchComplaints() -> [Complaint] {
        do {
            return try modelContext.fetch(FetchDescriptor<Complaint>())
        } catch {
            print("Failed to fetch messages: \(error.localizedDescription)")
            return []
        }
    }

    func addComplaint(_ complaint: Complaint) {
        modelContext.insert(complaint)
        saveContext()
    }

    func deleteComplaint(_ complaint: Complaint) {
        modelContext.delete(complaint)
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
