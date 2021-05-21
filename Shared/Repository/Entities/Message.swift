//
//  Message.swift
//  StoryHood
//
//  Created by Kellyane Nogueira on 18/05/21.
//

import Foundation

enum MessageType: String, Codable, Equatable {
    case reader
    case character
    case unknown

    public init(from decoder: Decoder) throws {
        guard let rawValue = try? decoder.singleValueContainer().decode(String.self) else {
            self = .unknown
            return
        }
        self = MessageType(rawValue: rawValue) ?? .unknown
    }
}

struct Message: Codable {
    let type: MessageType
    let text: String
    let id: Int
    let image: Data?
    let nextMessagesId: [Int]?
    let isLastMessage: Bool
}

struct MessagesRecord: Codable {
    let messages: [Message]
}
