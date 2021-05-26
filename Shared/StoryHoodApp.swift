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
    let messagesInteractor = MessagesInteractor()

    var body: some Scene {
        WindowGroup {
            MessageView()
                .environmentObject(messagesInteractor.appState)
                .environmentObject(messagesInteractor)
        }
    }
}
