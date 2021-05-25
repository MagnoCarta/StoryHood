//
//  MessagesListView.swift
//  StoryHood
//
//  Created by Tales Conrado on 19/05/21.
//

import SwiftUI

struct MessagesListView: View {

    let messages: [Message]
    @State private var lastSeenMessageId: Int = -1
    @State private var onScreenMessages: [Message] = []
    @State private var isTyping = false
    let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()

    var body: some View {
        VStack {
            MessagesTopBar(isTyping: $isTyping)
            ScrollView {
                VStack {
                    ForEach(onScreenMessages, id: \.id) { message in
                        MessageBubble(messageType: message.type) {
                            Text(message.text ?? "")
                        }
                    }
                }
            }
        }
        .background(Color(.displayP3, red: 252/255, green: 249/255, blue: 246/255, opacity: 1))
        .onReceive(timer, perform: { _ in
            typingToggle()
        })
    }

    private func typingToggle() {
        if let nextMessage = messages.first(where: { !onScreenMessages.contains($0) }) {
            if isTyping {
                onScreenMessages.append(nextMessage)
            }
        } else {
            isTyping.toggle()
        }
        isTyping.toggle()
    }
}
