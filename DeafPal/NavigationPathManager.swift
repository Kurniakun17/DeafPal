//
//  NavigationPathCoordinator.swift
//  DeafPal
//
//  Created by Kurnia Kharisma Agung Samiadjie on 25/10/24.
//

import Foundation
import SwiftUI

class NavigationPathManager: ObservableObject {
    @Published var path = NavigationPath()

    func push(T: any) {
        path.append(T)
    }

    func pop() {
        path.removeLast()
    }

    func reset() {
        path.removeAll()
    }
}
