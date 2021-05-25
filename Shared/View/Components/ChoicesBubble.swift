//
//  ChoicesBubble.swift
//  StoryHood
//
//  Created by Kellyane Nogueira on 19/05/21.
//

import SwiftUI

struct ChoicesView: View {
    @Binding var text: String
    var choices: [Option] = [Option(text: "Você fez maravilhas, loucuras no meu coração. Um beijo para você, não posso demorar. Tô numa ligação urbana, tem mais gente pra ligarVocê fez maravilhas, loucuras no meu coração. Um beijo para você, não posso demorar. Tô numa ligação urbana, tem mais gente pra ligar", id: 1), Option(text: "Você fez maravilhas, loucuras no meu coração. Um beijo para você, não posso demorar. Tô numa ligação urbana, tem mais gente pra ligar", id: 2), Option(text: "Você fez maravilhas, loucuras no meu coração. Um beijo para você, não posso demorar. Tô numa ligação urbana, tem mais gente pra ligar", id: 3)]
    
    @State var selectedOption: Option? = nil
    
    var body: some View {
        VStack {
            ForEach(choices, id: \.id) { option in
                OptionBubble(isSelected: option == selectedOption, option: option)
                    .onTapGesture {
    
                        selectedOption = option
                        
                        let subAnswer = Substring(option.text)
                        var repetitions = 0
                        
                        Timer.scheduledTimer(withTimeInterval: 0.09, repeats: true) { [self] timer in
                        
                            repetitions+=1
                            let range = subAnswer.index(subAnswer.startIndex, offsetBy: repetitions)
                            
                            text = String(subAnswer[..<range])
                            
                            if repetitions == option.text.count {
                                timer.invalidate()
                            }
                        }
                    }
            }
        }
    }

}

