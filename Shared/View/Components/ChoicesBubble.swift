//
//  ChoicesBubble.swift
//  StoryHood
//
//  Created by Kellyane Nogueira on 19/05/21.
//

import SwiftUI

struct ChoicesView: View {
    @Binding var text: String
    var choices: [Option] = [Option(text: "Você fez maravilhas, loucuras no meu coração. Um beijo para você, não posso demorar. Tô numa ligação urbana, tem mais gente pra ligar. Você fez maravilhas, loucuras no meu coração. Um beijo para você, não posso demorar.Você fez maravilhas, loucuras no meu coração. Um beijo para você, não posso demorar. Tô numa ligação urbana, tem mais gente pra ligar. Você fez maravilhas, loucuras no meu coração. Um beijo para você, não posso demorar.", id: 1), Option(text: "Um beijo para você, não posso demorar. Tô numa ligação urbana, tem mais gente pra ligar. Você fez maravilhas, loucuras no meu coração. Um beijo para você, não posso demorar.", id: 2), Option(text: "Você fez maravilhas, loucuras no meu coração. Um beijo para você, não posso demorar. Tô numa ligação urbana, tem mais gente pra ligar. Você fez maravilhas, loucuras no meu coração. Um beijo para você, não posso demorar.Você fez maravilhas, loucuras no meu coração. ", id: 3)]
    
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

