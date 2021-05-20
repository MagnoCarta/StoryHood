//
//  ServiceTeste.swift
//  StoryHood
//
//  Created by Kellyane Nogueira on 18/05/21.
//

import Foundation

protocol MessageRepository {
    func getMessagesFromJSON() -> Messages?
}


//MARK: - Read JSON file

struct readJSON: MessageRepository {

    let url = Bundle.main.url(forResource: "message", withExtension: "json")
    
    func getMessagesFromJSON() -> Messages? {
        
        guard let url = url else { return nil }
        var messages: Messages
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            messages = try decoder.decode(Messages.self, from: data)
            return messages
        }
        catch {
            print(error.localizedDescription)
        }
        
        return nil
    }
}
