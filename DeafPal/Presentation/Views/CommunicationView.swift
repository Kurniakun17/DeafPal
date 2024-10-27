//
//  Communcation.swift
//  DeafPal
//
//  Created by Kurnia Kharisma Agung Samiadjie on 25/10/24.
//

import SwiftUI

struct CommunicationView: View {
    @EnvironmentObject var viewModel: CommunicationViewModel

    var body: some View {
        VStack {
            ScrollViewReader {
                proxy in
                ScrollView(.vertical) {
                    VStack(spacing: 12) {
                        ForEach(viewModel.selectedMessageRecord.messages, id: \.self) {
                            message in
                            MessageBubble(messageData: message,
                                          onQuickOptionHandler: viewModel.quickOptionsHandler)
                        }
                    }
                    .animation(.spring(), value: viewModel.selectedMessageRecord.messages)
                    .padding(.horizontal, 16)

                    Color.clear
                        .frame(height: 1)
                        .id("Bottom")
                }
                .onChange(of: viewModel.selectedMessageRecord.messages) {
                    _ in
                    print("new")
                    withAnimation {
                        proxy.scrollTo("Bottom", anchor: .bottom)
                    }
                }
            }
            Spacer()
            VStack(spacing: 12) {
                HStack {
                    Button(action: {
                        viewModel.textRole = .user
                    }) {
                        Text("Kirim Sebagai Pasien")
                            .font(.footnote)
                            .foregroundStyle(viewModel.textRole == .user ? .white : .primaryBrand)
                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
                    .background(viewModel.textRole == .user ? .primaryBrand : .outline)
                    .clipShape(RoundedRectangle(cornerRadius: 12))

                    Button(action: {
                        viewModel.textRole = .doctor
                    }) {
                        Text("Kirim Sebagai Dokter")
                            .font(.footnote)
                            .foregroundStyle(viewModel.textRole == .doctor ? .white : .primaryBrand)
                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
                    .background(viewModel.textRole == .doctor ? .primaryBrand : .outline)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                }
                HStack(spacing: 16) {
                    TextField("Masukkan pesanmu disini", text: $viewModel.textInput)
                        .autocorrectionDisabled()
                        .padding(10)
                        .padding(.horizontal, 10)
                        .background(Color.white)
                        .cornerRadius(200)
                        .overlay(
                            RoundedRectangle(cornerRadius: 200)
                                .stroke(.outline, lineWidth: 1)
                        )

                    if viewModel.textInput.isEmpty {
                        Button(action: {
                            viewModel.isSpeechEnabled = true
                        }) {
                            Image(systemName: "mic.fill")
                        }
                        .frame(width: 32, height: 32)
                        .foregroundStyle(.primaryBrand)
                    } else {
                        Button(action: {
                            viewModel.addMessage()
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
        .sheet(isPresented: $viewModel.isSpeechEnabled) {
            VStack {
                Text("Rekam Suara Ke Teks")
                    .font(.title3)
                    .fontWeight(.bold)
                Spacer()
                Button(action: {
                    viewModel.isSpeechEnabled = false
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
        CommunicationView()
            .environmentObject(CommunicationViewModel(
                selectedMessageRecord: CommunicationViewModel.defaultSeededRecord(),
                fetchMessagesUseCase: FetchMessagesRecordUseCase(repository: MessagesRecordRepository()),
                addMessageRecordUseCase: AddMessageRecordUseCase(repository: MessagesRecordRepository()),
                deleteMessageRecordUseCase: DeleteMessageRecordUseCase(repository: MessagesRecordRepository()),
                addMessageToRecordUseCase: AddMessageToRecordUseCase(repository: MessagesRecordRepository())
            ))
    }
}
