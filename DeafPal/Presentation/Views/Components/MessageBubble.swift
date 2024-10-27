//
//  MessageBubble.swift
//  DeafPal
//
//  Created by Kurnia Kharisma Agung Samiadjie on 27/10/24.
//

import SwiftUI

struct MessageBubble: View {
    var messageData: Message

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
                VStack(alignment: messageData.role == .user ? .leading : .trailing) {
                    Text(messageData.text)
                        .padding(.bottom, 1)
                    Text(formattedTime)
                        .font(.caption2)
                }
                .padding(10)
                .background(messageData.role == .user ? .primaryBrand : .white)
                .foregroundStyle(messageData.role == .user ? .white : .black)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            .frame(maxWidth: .infinity, alignment: messageData.role == .user ? .trailing : .leading)
        }
        .id(messageData.id)
        .transition(messageTransition(for: messageData.role))
    }
}

#Preview {
    MessageBubble(
        messageData: Message(text: "Hello World", role: .user,
                             date: Date().addingTimeInterval(-3600)))
}
