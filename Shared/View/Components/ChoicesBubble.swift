//
//  ChoicesBubble.swift
//  StoryHood
//
//  Created by Kellyane Nogueira on 19/05/21.
//

import SwiftUI

struct ChoicesView: View {
    @Binding var text: String
    var choices: [Option] = [Option(text: "option 1", id: 1), Option(text: "option 2", id: 2), Option(text: "option 3", id: 3)]
    
    @State var selectedOption: Option? = nil
    
    var body: some View {
        VStack {
            ForEach(choices, id: \.id) { option in
                OptionBubble(isSelected: option == selectedOption, option: option)
                    .onTapGesture {
                        selectedOption = option
//                        var splitText = Array(option.text)
//                        for i in splitText {
//                            text += i
//                        }
                        text = option.text
                    }
            }
        }
    }

}

