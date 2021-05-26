//
//  AnswerState.swift
//  StoryHood
//
//  Created by Kellyane Nogueira on 19/05/21.
//

import SwiftUI

class MessageState: ObservableObject {

    @Published var onScreenMessages: [Message] = []
    @Published var currentOptions: [String] = []
    @Published var lastMessage: Message?

    func send(message: Message) {
        onScreenMessages.append(message)
        lastMessage = message
    }
}

