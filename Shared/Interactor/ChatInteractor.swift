//
//  ChatInteractor.swift
//  StoryHood
//
//  Created by Kellyane Nogueira on 18/05/21.
//

import Foundation
import SwiftUI

protocol MessagesInteractor {
    func loadMessages()
}

struct ChatInteractor: MessagesInteractor, EnvironmentKey {
    
    let messageRepository: MessageRepository
    
    init(messageRepository: MessageRepository) {
        self.messageRepository = messageRepository
    }
    
    
    func loadMessages() {
        
        guard let messages = messageRepository.getMessagesFromJSON() else { return }
        
        messages.messages.forEach { message in
            if message.id == 1 {
                print("First Message: \(message.text)")
            }
        }
    }
    
    static var defaultValue: Self { Self.default }
    
    private static let `default` = Self(messageRepository: MessageRepository.self as! MessageRepository)
}

extension EnvironmentValues {
    
    var interactor: ChatInteractor {
        get { self[ChatInteractor.self] }
        set { self[ChatInteractor.self] = newValue }
    }
}
