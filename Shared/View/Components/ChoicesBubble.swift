//
//  ChoicesBubble.swift
//  StoryHood
//
//  Created by Kellyane Nogueira on 19/05/21.
//

import SwiftUI

struct ChoicesView: View {
    @Binding var text: String
    @EnvironmentObject var appState: MessageState

    @State var choices: [Option] = []
    @State var isTyping = false
    @State var selectedOption: Option? = nil
    
    var body: some View {
        VStack {
            ForEach(choices, id: \.id) { option in
                OptionBubble(isSelected: option == selectedOption, option: option)
                    .onTapGesture {
    
                        selectedOption = option
                        
                        let subAnswer = Substring(option.text)
                        var repetitions = 0
                        if !isTyping {
                            Timer.scheduledTimer(withTimeInterval: 0.09, repeats: true) { [self] timer in
                                isTyping = true
                                repetitions+=1
                                let range = subAnswer.index(subAnswer.startIndex, offsetBy: repetitions)

                                text = String(subAnswer[..<range])

                                if repetitions == option.text.count {
                                    timer.invalidate()
                                    isTyping = false
                                }
                            }
                        }
                    }
            }.onReceive(appState.$currentOptions) { currentOptions in
                transformStringsToOptions(options: currentOptions)
            }
        }
    }

    private func transformStringsToOptions(options: [String]) {
        choices = []
        options.forEach({ choices.append(Option(text: $0, id: .random(in: 0...300))) })
    }

}

