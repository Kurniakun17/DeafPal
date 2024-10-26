//
//  ContentView.swift
//  DeafPal
//
//  Created by Kurnia Kharisma Agung Samiadjie on 25/10/24.
//
import SwiftUI

struct ContentView: View {
    @StateObject var coordinator = AppCoordinator()

    var body: some View {
        NavigationStack(path: $coordinator.path) {
            Home()

                .navigationDestination(for: AppView.self, destination: { newAppView in
                    switch newAppView {
                    case .home:
                        Home()
                    case .communicaton:
                        CommuncationView()
                    case .medicalInstructions:
                        MedicalInstructionView()
                    case .complaintNote:
                        ComplaintNoteView()
                    }
                })
        }.environmentObject(coordinator)
    }
}

#Preview {
    ContentView()
        .environmentObject(AppCoordinator())
}
