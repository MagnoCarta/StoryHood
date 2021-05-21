//
//  Character.swift
//  StoryHood
//
//  Created by Kellyane Nogueira on 18/05/21.
//

import Foundation

enum CharacterName: String, Codable, Equatable {
    case littleRedHood
    case badWolf
    case unknown

    public init(from decoder: Decoder) throws {
        guard let rawValue = try? decoder.singleValueContainer().decode(String.self) else {
            self = .unknown
            return
        }
        self = CharacterName(rawValue: rawValue) ?? .unknown
    }
}



struct Character: Codable, Hashable {
    let name: CharacterName
    let narrativeId: String?
    let isActive: Bool
}
