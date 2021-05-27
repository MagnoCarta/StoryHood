//
//  MessagesListView.swift
//  StoryHood
//
//  Created by Tales Conrado on 19/05/21.
//

import SwiftUI

struct MessagesListView: View {

    @State private var lastSeenMessageId: Int = -1
    @State private var onScreenMessages: [Message] = []
    @State private var isTyping = false
    @EnvironmentObject var interactor: MessagesInteractor
    @EnvironmentObject var appState: MessageState
    let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()

    var body: some View {
        VStack {
            MessagesTopBar(isTyping: $isTyping)
            ScrollView {
                VStack {
                    ForEach(onScreenMessages, id: \.id) { message in
                        MessageBubble(messageType: message.type) {
                            Text(message.text)
                        }
                    }
                }
            }
        }
        .background(Color(.displayP3, red: 252/255, green: 249/255, blue: 246/255, opacity: 1))
        .onReceive(appState.$lastMessage) {
            guard let message = $0, message.type == .reader else { return }
            answerMessage()
        }
        .onReceive(timer) { _ in
            typingToggle()
        }
    }

    private func typingToggle() {
        if let nextMessage = appState.onScreenMessages.first(where: { !onScreenMessages.contains($0) }) {
            if isTyping {
                onScreenMessages.append(nextMessage)
            }
        } else {
            isTyping.toggle()
            interactor.showAnswerOptions()
        }
        isTyping.toggle()
    }

    func answerMessage() {
        if let nextMessage = appState.onScreenMessages.first(where: { !onScreenMessages.contains($0) }),
           nextMessage.type == .reader {
            onScreenMessages.append(nextMessage)
        }
    }
}
