//
//  StoryHoodApp.swift
//  Shared
//
//  Created by Kellyane Nogueira on 18/05/21.
//

import SwiftUI

@main
struct StoryHoodApp: App {
    let persistenceController = PersistenceController.shared
    let messages: [Message] = [Message(type: .character, text: "Oi, eu sou o Lobo Bad Lobo huhuhuh", id: 1, image: nil, isLastMessage: false),
                               Message(type: .reader, text: "Olá e eu não sou mal não", id: 2, image: nil, isLastMessage: false),
                               Message(type: .character, text: "ta certo entao seu mentiroso vc vai ver eu vou te pegar e vc vai virar um porquinho q constroi casa de palha e ai eu vou coisa e vc vai ver", id: 3, image: nil, isLastMessage: false)]

    var body: some Scene {
        WindowGroup {
            AnswerView.init(isEnabled: .constant(true))
        }
//        WindowGroup {
//            MessagesListView(messages: messages)
//        }
    }
}
