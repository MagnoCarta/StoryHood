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

    var body: some Scene {
        WindowGroup {
            AnswerView.init(isEnabled: .constant(true))
        }
    }
}
