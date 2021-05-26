//
//  ServiceTeste.swift
//  StoryHood
//
//  Created by Kellyane Nogueira on 18/05/21.
//

import Foundation

protocol MessageRepository {
    func readLocalJSONFile(forName name: String) -> Data?
}


//MARK: - Read JSON file

struct readJSON: MessageRepository {
    
    public init() {}
    
    func readLocalJSONFile(forName name: String) -> Data? {
        do {
            if let filePath = Bundle.main.path(forResource: name, ofType: "json") {
                let fileUrl = URL(fileURLWithPath: filePath)
                let data = try Data(contentsOf: fileUrl)
                return data
            }
        } catch {
            print("error: \(error)")
        }
        
        return nil
    }
}
