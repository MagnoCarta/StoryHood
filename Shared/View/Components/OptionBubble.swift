//
//  OptionBubble.swift
//  StoryHood
//
//  Created by Kellyane Nogueira on 21/05/21.
//

import SwiftUI

struct OptionBubble: View {
    
    let isSelected: Bool
    let option: Option
    
    var body: some View {
        if !isSelected {
            VStack {
                Text(option.text)
                    .frame(width: 750)
            }
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 6)
                .stroke(Color(0xF3EDE4), lineWidth: 2)
            )
            .background(Color(0xF3EDE4))
            .cornerRadius(6)
            .multilineTextAlignment(.center)
            
        } else {
            VStack {
                Text(option.text)
                    .frame(width: 750)
            }
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 6)
                .stroke(Color(0xF69090), lineWidth: 2)
            )
            .background(Color(0xFEEED7))
            .cornerRadius(6)
            .multilineTextAlignment(.center)
            
        }
    }
    
}

