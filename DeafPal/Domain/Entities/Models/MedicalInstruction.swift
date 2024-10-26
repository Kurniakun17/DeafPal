//
//  MedicalInstruction.swift
//  DeafPal
//
//  Created by Kurnia Kharisma Agung Samiadjie on 26/10/24.
//

import Foundation

struct MedicalInstruction: Identifiable, Hashable {
    var id: UUID = .init()
    var title: String
    var description: String
    var doctorName: String
    var consultationDate: Date
    var instructionType: InstructionType
}

struct MedicalInstructionRecord: Identifiable, Hashable {
    var id: UUID = .init()
    var title: String
    var instructions: [MedicalInstruction] = []
}
