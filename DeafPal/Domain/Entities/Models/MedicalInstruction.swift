//
//  MedicalInstruction.swift
//  DeafPal
//
//  Created by Kurnia Kharisma Agung Samiadjie on 26/10/24.
//

import Foundation
import SwiftData

@Model
class MedicalInstruction: Identifiable, Hashable {
    var id: UUID
    var title: String
    var textDescription: String
    var doctorName: String
    var consultationDate: Date
    var instructionType: InstructionType

    init(id: UUID = .init(), title: String, description: String, doctorName: String, consultationDate: Date, instructionType: InstructionType) {
        self.id = id
        self.title = title
        self.textDescription = description
        self.doctorName = doctorName
        self.consultationDate = consultationDate
        self.instructionType = instructionType
    }
}
