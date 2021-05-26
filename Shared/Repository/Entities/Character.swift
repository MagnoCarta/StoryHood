//
//  Character.swift
//  StoryHood
//
//  Created by Kellyane Nogueira on 18/05/21.
//

import Foundation

enum PersonageName: String, Codable, Equatable {
    case littleRedHood
    case badWolf
    case unknown

    public init(from decoder: Decoder) throws {
        guard let rawValue = try? decoder.singleValueContainer().decode(String.self) else {
            self = .unknown
            return
        }
        self = PersonageName(rawValue: rawValue) ?? .unknown
    }
}

struct Personage: Codable {
    let name: PersonageName
    let narrativeId: String?
}
