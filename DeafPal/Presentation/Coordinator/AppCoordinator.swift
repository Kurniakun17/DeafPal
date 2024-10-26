//
//  NavigationPathCoordinator.swift
//  DeafPal
//
//  Created by Kurnia Kharisma Agung Samiadjie on 25/10/24.
//
import SwiftUI

enum AppView: Hashable {
    case home
    case medicalInstructions
    case communicaton
    case complaintNotes
}


class AppCoordinator: ObservableObject {
    @Published var path = NavigationPath()
    @Published var selectedView: AppView = .home
    
   
    func navigate(to view: AppView) {
        selectedView = view
        path.append(view)
    }
    
    func pop() {
        path.removeLast()
    }
    
    func reset() {
        path.removeLast(path.count)
    }
}
