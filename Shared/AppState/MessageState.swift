//
//  AnswerState.swift
//  StoryHood
//
//  Created by Kellyane Nogueira on 19/05/21.
//

import SwiftUI

class MessageState: ObservableObject {

    @Published var onScreenMessages: [Message] = []
    @Published var currentOptions: [Message] = []
    @Published var lastMessage: Message?
    @Published var selectedOption: Option?
    @Published var characters = [Personage(name: .littleRedHood, narrativeId: "littleRedRidingHood", isActive: true),
    Personage(name: .badWolf, narrativeId: "badWolf", isActive: false)]

    func send(message: Message) {
        onScreenMessages.append(message)
        lastMessage = message
    }
}

