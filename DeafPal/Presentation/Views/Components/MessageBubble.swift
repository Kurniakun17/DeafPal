//
//  MessageBubble.swift
//  DeafPal
//
//  Created by Kurnia Kharisma Agung Samiadjie on 27/10/24.
//

import SwiftUI

struct MessageBubble: View {
    var messageData: Message
    var onQuickOptionHandler: ((_ value: String) -> Void) = { _ in }

    private var formattedTime: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        return formatter.string(from: messageData.date)
    }

    func messageTransition(for role: UserRole) -> AnyTransition {
        if role == .user {
            return .asymmetric(
                insertion: .move(edge: .trailing).combined(with: .opacity),
                removal: .opacity
            )
        } else {
            return .asymmetric(
                insertion: .move(edge: .leading).combined(with: .opacity),
                removal: .opacity
            )
        }
    }

    var body: some View {
        VStack {
            VStack {
                VStack(alignment: messageData.role == .user ? .leading : .trailing, spacing: 12) {
                    if messageData.quickOptions.isEmpty {
                        VStack(alignment: .leading) {
                            Text(messageData.text)
                                .multilineTextAlignment(.leading)
                        }
                    } else {
                        VStack(alignment: .leading) {
                            Text(messageData.text)
                                .multilineTextAlignment(.leading)
                        }

                        .frame(maxWidth: .infinity, alignment: .leading)
                    }

                    ForEach(messageData.quickOptions, id: \.self) {
                        value in
                        Button(action: {
                            onQuickOptionHandler(value)
                        }) {
                            HStack {
                                Text(value)

                                Spacer()

                                Image(systemName: "chevron.right")
                                    .foregroundStyle(.gray)
                            }
                            .padding(.horizontal, 12)
                            .padding(.vertical, 10)
                            .background(.accentShade)
                            .multilineTextAlignment(.leading)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                        }
                    }

                    Text(formattedTime)
                        .font(.caption2)
                }
                .padding(16)
                .background(messageData.role == .user ? .primaryBrand : .white)
                .foregroundStyle(messageData.role == .user ? .white : .black)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            .frame(maxWidth: .infinity, alignment: messageData.role == .user ? .trailing : .leading)
            .padding(.leading, messageData.role == .user ? 40 : 0)
            .padding(.trailing, messageData.role == .doctor ? 40 : 0)
        }
        .id(messageData.id)
        .transition(messageTransition(for: messageData.role))
    }
}

#Preview {
    VStack {
        MessageBubble(
            messageData: Message(text: "Hello World",
                                 role: .doctor,
                                 date: Date().addingTimeInterval(-3600),
                                 quickOptions: ["Demam", "Batuk", "Flu"]))
        MessageBubble(
            messageData: Message(text: "Hello World",
                                 role: .user,
                                 date: Date().addingTimeInterval(-3600)))
    }
    .padding()
    .background(.bg)
}
