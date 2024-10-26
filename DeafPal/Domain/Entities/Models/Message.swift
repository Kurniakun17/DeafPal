//
//  Message.swift
//  DeafPal
//
//  Created by Kurnia Kharisma Agung Samiadjie on 26/10/24.
//

import Foundation

struct Message: Identifiable {
    var id: UUID = .init()
    var text: String = ""
    var role: UserRole
    var date: Date = .now
}
