//
//  Option.swift
//  StoryHood
//
//  Created by Kellyane Nogueira on 21/05/21.
//

import SwiftUI

struct Option: Identifiable, Equatable {
    let id: Int
    var text: String
    
    init(text: String, id: Int) {
        self.id = id
        self.text = text
    }
    
}
