//
//  ComplaintEntities.swift
//  DeafPal
//
//  Created by Kurnia Kharisma Agung Samiadjie on 25/10/24.
//

import Foundation

struct Complaint: Codable, Identifiable {
    var id: UUID = .init()
    var title: String = ""
    var summary: [String] = []
    var date: Date = .now
}

