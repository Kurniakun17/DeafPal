
//
//  home.swift
//  DeafPal
//
//  Created by Kurnia Kharisma Agung Samiadjie on 25/10/24.
//

import SwiftUI

struct Home: View {
    @EnvironmentObject var appCoordinator: AppCoordinator

    var body: some View {
        VStack(spacing: 16) {
            HStack {
                VStack {
                    Text("Halo Fildzah! 👋")
                        .font(.title)
                        .fontWeight(.bold)
                }
                .frame(maxWidth: .infinity, alignment: .leading)

                Button(action: {}) {
                    Text("⚙️")
                        .font(.title3)
                }
                .padding(8)
                .background(.outline)
                .clipShape(RoundedRectangle(cornerRadius: 12))
            }

            Button(action: {
                appCoordinator.navigate(to: .complaintNote)
            }) {
                HStack(spacing: 16) {
                    Image("complaintEmoji")
                        .padding(12)
                        .background(.primaryHeavy)
                        .clipShape(RoundedRectangle(cornerRadius: 20))

                    VStack(alignment: .leading, spacing: 8) {
                        Text("Catat Keluhan")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundStyle(.white)

                        Text("Ceritakan apayang kamu rasakan")
                            .font(.footnote)
                            .foregroundStyle(.white)
                    }
                }
                .padding(.vertical, 50)
                .padding(.horizontal, 16)
                .frame(maxWidth: .infinity)
                .background(.primaryBrand)
                .clipShape(RoundedRectangle(cornerRadius: 36))
            }

            HStack(spacing: 16) {
                Button(action: {
                    appCoordinator.navigate(to: .communicaton)
                }) {
                    VStack(alignment: .leading, spacing: 10) {
                        Image("communicationEmoji")
                            .padding()
                            .background(.outline.opacity(0.4))
                            .clipShape(RoundedRectangle(cornerRadius: 20))

                        VStack(alignment: .leading) {
                            Text("Mulai")
                                .font(Font.custom("SF Pro Rounded", size: 14))
                                .bold()

                            Text("Komunikasi")
                                .font(Font.custom("SF Pro Rounded", size: 18))
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(24)
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 36))
                }
                .foregroundStyle(.black)

                Button(action: {
                    appCoordinator.navigate(to: .medicalInstructions)
                }) {
                    VStack(alignment: .leading, spacing: 10) {
                        Image("instructionEmoji")
                            .padding()
                            .background(.outline.opacity(0.4))
                            .clipShape(RoundedRectangle(cornerRadius: 20))

                        VStack(alignment: .leading) {
                            Text("Tambah")
                                .font(Font.custom("SF Pro Rounded", size: 14))
                                .fontWeight(.semibold)

                            Text("Instruksi Medis")
                                .font(Font.custom("SF Pro Rounded", size: 18))
                                .fontWeight(.bold)
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(24)
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 36))
                }
                .foregroundStyle(.black)
            }

            VStack(spacing: 8) {
                HStack {
                    Text("Riwayat")
                        .fontWeight(.semibold)
                        .foregroundStyle(.black.opacity(0.3))
                    Spacer()

                    Picker("Sort", selection: .constant(0)) {
                        Text("Terbaru").tag(0)
                            .font(.subheadline)

                        Text("Terlama").tag(1)
                            .font(.subheadline)
                    }
                    .font(.subheadline)
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 12)

                Picker("History", selection: .constant(0)) {
                    Text("Keluhan").tag(0)
                    Text("Komunikasi").tag(1)
                    Text("Instruksi Medis").tag(2)
                }
                .pickerStyle(.segmented)

                ScrollView {
                    VStack {
                        ForEach(["1", "2", "3", "4", "4"], id: \.self) {
                            _ in
                            HStack {
                                Calendar()
                                Text("Lorem Ipsum Dolor Sit amet")
                                    .font(.subheadline)
                                Spacer()
                            }
                        }
                    }
                }
            }
            .padding(.horizontal, 8)
            Spacer()
        }
        .padding(.horizontal, 16)
        .background(.bg)
    }
}

#Preview {
    Home()
        .environmentObject(AppCoordinator())
}
