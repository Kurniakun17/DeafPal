//
//  Communcation.swift
//  DeafPal
//
//  Created by Kurnia Kharisma Agung Samiadjie on 25/10/24.
//

import SwiftUI

struct CommuncationView: View {
    @State var textInput: String = ""
    @State var messages = [Message(text: "Halo Dokter", role: .user),
                           Message(text: "Halo, Apa keluhanmu hari ini?", role: .doctor)]
    @State var isSpeechEnabled: Bool = false
    @State var textRole: UserRole = .user

    var body: some View {
        VStack {
            ScrollView {
                VStack(spacing: 12) {
                    ForEach(messages, id: \.self) {
                        message in
                        MessageBubble(messageData: message)
                    }
                }
                .animation(.spring(), value: messages)
                .padding(.horizontal, 16)
            }
            Spacer()
            VStack(spacing: 12) {
                HStack {
                    Button(action: {
                        textRole = .user
                    }) {
                        Text("Kirim Sebagai Pasien")
                            .font(.subheadline)
                            .foregroundStyle(textRole == .user ? .white : .primaryBrand)
                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
                    .background(textRole == .user ? .primaryBrand : .outline)
                    .clipShape(RoundedRectangle(cornerRadius: 12))

                    Button(action: {
                        textRole = .doctor
                    }) {
                        Text("Kirim Sebagai Dokter")
                            .font(.subheadline)
                            .foregroundStyle(textRole == .doctor ? .white : .primaryBrand)
                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
                    .background(textRole == .doctor ? .primaryBrand : .outline)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                }
                HStack(spacing: 16) {
                    TextField("Masukkan pesanmu disini", text: $textInput)
                        .autocorrectionDisabled()
                        .padding(10)
                        .background(Color.white)
                        .cornerRadius(200)
                        .overlay(
                            RoundedRectangle(cornerRadius: 200)
                                .stroke(.outline, lineWidth: 1)
                        )

                    if textInput.isEmpty {
                        Button(action: {
                            isSpeechEnabled = true
                        }) {
                            Image(systemName: "mic.fill")
                        }
                        .frame(width: 32, height: 32)
                        .foregroundStyle(.primaryBrand)
                    } else {
                        Button(action: {
                            messages.append(Message(text: textInput, role: textRole))
                            textInput = ""
                        }) {
                            Image(systemName: "paperplane.fill")
                                .foregroundStyle(.white)
                        }
                        .frame(width: 32, height: 32)
                        .background(.primaryBrand)
                        .clipShape(RoundedRectangle(cornerRadius: 300))
                    }
                }
            }
            .padding(20)
            .background(.white)
        }
        .navigationTitle("Dr. Edi")
        .navigationBarTitleDisplayMode(.inline)
        .background(.bg)
        .sheet(isPresented: $isSpeechEnabled) {
            VStack {
                Text("Rekam Suara Ke Teks")
                    .font(.title3)
                    .fontWeight(.bold)
                Spacer()
                Button(action: {
                    isSpeechEnabled = false
                }) {
                    Image(systemName: "mic.fill")
                        .foregroundStyle(.white)
                        .font(.system(size: 48))
                }
                .frame(width: 80, height: 80)
                .background(.red)
                .clipShape(RoundedRectangle(cornerRadius: 200))
                Spacer()
                Text("Hai")
            }
            .padding()
            .padding(.vertical, 20)
            .presentationDetents([.height(300), .fraction(1)])
        }
    }
}

#Preview {
    NavigationStack {
        CommuncationView()
    }
}
