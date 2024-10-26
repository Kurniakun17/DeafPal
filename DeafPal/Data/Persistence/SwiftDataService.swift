//
//  SwiftDataService.swift
//  DeafPal
//
//  Created by Kurnia Kharisma Agung Samiadjie on 26/10/24.
//

import SwiftData
import SwiftUI

class SwiftDataService {
    private let modelContainer: ModelContainer
    let modelContext: ModelContext

    @MainActor
    static let shared = SwiftDataService()

    @MainActor
    private init() {
        self.modelContainer = try! ModelContainer(for: Message.self, Complaint.self, MedicalInstructionRecord.self, configurations: ModelConfiguration(isStoredInMemoryOnly: false))

        self.modelContext = modelContainer.mainContext
    }
}
