//
//  MedicalInstructionRecordsRepository.swift
//  DeafPal
//
//  Created by Kurnia Kharisma Agung Samiadjie on 26/10/24.
//

import Foundation
import SwiftData

protocol MedicalInstructionRepositoryProtocol {
    func fetchMedicalInstructions() -> [MedicalInstructionRecord]
    func addMedicalInstruction(_ record: MedicalInstructionRecord)
    func deleteMedicalInstruction(_ record: MedicalInstructionRecord)
}

final class MedicalInstructionRecordsRepository: MedicalInstructionRepositoryProtocol {
    private let modelContext: ModelContext

    init(modelContext: ModelContext = SwiftDataService.shared.modelContext) {
        self.modelContext = modelContext
    }

    func fetchMedicalInstructions() -> [MedicalInstructionRecord] {
        do {
            return try modelContext.fetch(FetchDescriptor<MedicalInstructionRecord>())
        } catch {
            print("Failed to fetch medical instructions: \(error.localizedDescription)")
            return []
        }
    }

    func addMedicalInstruction(_ record: MedicalInstructionRecord) {
        modelContext.insert(record)
    }

    func deleteMedicalInstruction(_ record: MedicalInstructionRecord) {
        modelContext.delete(record)
    }
}
