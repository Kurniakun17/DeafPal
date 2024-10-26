//
//  ContentView.swift
//  DeafPal
//
//  Created by Kurnia Kharisma Agung Samiadjie on 25/10/24.
//

struct Mahasiswa: Hashable {
    let nama: String
    let nim: String
}

import SwiftUI

struct ContentView: View {
    @State var path = NavigationPath()
    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("This is root!")
                Button("Tambahkan Mahasiswa") {
                    path.append(Mahasiswa(nama: "Kurnia", nim: "2110511068"))
                }
                NavigationLink("Masukan string", value: "Wow")
            }
            .padding()
            .navigationDestination(for: String.self, destination: { value in
                Text("This is \(value)")
                Button("Tambahkan Mahasiswa") {
                    path.append(Mahasiswa(nama: "Gacor", nim: "2110511068"))
                }
            })
            .navigationDestination(for: Mahasiswa.self) {
                value in
                Text("hai \(value.nama)")
            }
        }
    }
}

#Preview {
    ContentView()
}
