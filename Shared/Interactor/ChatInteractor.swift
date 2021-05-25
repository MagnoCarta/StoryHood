//
//  ChatInteractor.swift
//  StoryHood
//
//  Created by Kellyane Nogueira on 18/05/21.
//

import Foundation
import SwiftUI

protocol MessagesInteractor {
    func getMessagesListOfType(_ type: MessageType) -> [Message]
}

protocol ViewInteractor: ObservableObject {
    var load: MessagesInteractor { get }
}

class ChatInteractor: MessagesInteractor, ViewInteractor {
    
    var messagesList: MessagesRecord {
        get {
            return self.loadMessages() ?? MessagesRecord(messages: [])
        }
    }
    
    var messageRepository = readJSON()
    var appState = AppState()
    
    public init () {}
    
    func parse(jsonData: Data) -> MessagesRecord? {
        
        do {
            let decodedData = try JSONDecoder().decode(MessagesRecord.self, from: jsonData)
            return decodedData
        } catch {
            print("error: \(error)")
        }
        
        return nil
    }
    
    var load: MessagesInteractor {
        return self
    }
    
    func loadMessages() -> MessagesRecord? {
        
        let jsonData = messageRepository.readLocalJSONFile(forName: "message")
        if let data = jsonData {
            if let messages = parse(jsonData: data) {
                return messages
            }
        }
        return nil
    }
    
    
    func getMessagesListOfType(_ type: MessageType) -> [Message] {

        switch type {
        case .character:
            return messagesList.messages.filter {$0.type == .character}
        case .reader:
            return messagesList.messages.filter {$0.type == .reader}
        case .unknown:
            return []
        }
    }
    
    func setCurrentMesssage(_ id: Int = 1)  {
        
        let currentMsg = messagesList.messages.filter{$0.id == id}
        appState.currentMessage = currentMsg.first
    }
    
    func setNextMessagesFrom(id: Int) {
        let current = messagesList.messages.filter { $0.id == id }
        appState.nextMessages = messagesList.messages.filter {
            current.first?.nextMessagesId?.contains($0.id) ?? false
        }
    }
}


