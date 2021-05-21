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

protocol ViewInteractor: ObservableObject {
    associatedtype Model
    var load: MessagesInteractor { get }
}

class ChatInteractor: MessagesInteractor, ViewInteractor {
    
    typealias Model = ViewInteractor
    
    
    var messageRepository = readJSON()
    
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
    
    func loadMessages() {
        
        let jsonData = messageRepository.readLocalJSONFile(forName: "message")
        if let data = jsonData {
            if let messages = parse(jsonData: data) {
                messages.messages.forEach { message in
                    print(message.type)
                }
            }
        }
    }
}

