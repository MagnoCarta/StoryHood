//
//  AnswerInteractor.swift
//  StoryHood
//
//  Created by Kellyane Nogueira on 19/05/21.
//

import Foundation

class MessagesInteractor: ObservableObject {

    let appState = MessageState()
    var messageRepository = readJSON()
    
    @Published var isAnswerEnabled: Bool = false
    var lastShowMessage: Int = -1

    var messages: [Message] {
        get {
            getMessagesListOfType(.character)
        }
    }

    var choicesText: [Message] {
        get {
            getMessagesListOfType(.reader)
        }
    }

    var counter = -1

    func loadFirstMessages() {
        
        for (idx, message) in messages.enumerated() {
            if message.isLastMessage {
                appState.send(message: message)
                lastShowMessage = idx
                break
            }
            appState.send(message: message)
        }
    }
    
    func loadCurrentMessage(_ id: Int = 1)  {
        print(id)
        guard let currentMessage = messages.filter({$0.id == id}).first else { return }
        appState.currentOptions =  choicesText.filter {
            currentMessage.nextMessagesId?.contains($0.id) ?? false
        }
        appState.send(message: currentMessage)
    }
    
    func parse(jsonData: Data) -> MessagesRecord? {
        
        do {
            let decodedData = try JSONDecoder().decode(MessagesRecord.self, from: jsonData)
            return decodedData
        } catch {
            print("error: \(error)")
        }
        
        return nil
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
        
        guard let allMessages = loadMessages() else {return []}
        
        
        switch type {
        case .character:
            return allMessages.messages.filter {$0.type == .character}
        case .reader:
            return allMessages.messages.filter {$0.type == .reader}
        case .unknown:
            return []
        }
    }
    

    func showAnswerOptions() {
        if !isAnswerEnabled {
            
            loadCurrentMessage(appState.lastMessage?.id ?? 0)
            //appState.currentOptions = choicesText
            isAnswerEnabled = true
        }
    }

    func sendMessage() {
        isAnswerEnabled = false
        loadCurrentMessage(appState.selectedOption?.id ?? 0)
        //appState.send(message: answer)
        //getNextMessage()
    }

    func getNextMessage() {
        if lastShowMessage < messages.count - 1 {
            lastShowMessage += 1
            appState.onScreenMessages.append(messages[lastShowMessage])
        }
    }
    
    //Função para iniciar Choices e habilitar
}
