//
//  MedicalInstructionRecord.swift
//  DeafPal
//
//  Created by Kurnia Kharisma Agung Samiadjie on 26/10/24.
//

import Foundation
import SwiftData

@Model
class MedicalInstructionRecord: Identifiable {
    var id: UUID
    var title: String
    var instructions: [MedicalInstruction]

    init(id: UUID = .init(), title: String, instructions: [MedicalInstruction] = []) {
        self.id = id
        self.title = title
        self.instructions = instructions
    }
}
