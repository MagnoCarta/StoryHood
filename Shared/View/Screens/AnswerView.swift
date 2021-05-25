//
//  AnswerView.swift
//  StoryHood
//
//  Created by Kellyane Nogueira on 19/05/21.
//

import SwiftUI

struct AnswerView: View {
    @State private var text: String = ""
    @Binding var isEnabled: Bool //O pai vai ser @State e vai Habilitar/Desabilitar ChoicesView
    var interactor = AnswerInteractor()
    
     var body: some View {
        Spacer()
        VStack {
            HStack {
                if !isEnabled {
                    Text("Escreva sua mensagem")
                        .foregroundColor(.secondary)
                        .lineLimit(1)
                        .frame(width: 715, height: 35)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 17)
                            .stroke(Color(0xCBC5C5), lineWidth: 2)
                        )
                        .background(Color.white)
                        .cornerRadius(6)
                        .onTapGesture {
                            #if os(iOS)
                            let feedback = UINotificationFeedbackGenerator()
                            feedback.notificationOccurred(.error)
                            #endif
                        }
                    
                } else {
                    Text(text) //Or TextEditor(text: $text)
                        .lineLimit(3)
                        .frame(width: 715)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 6)
                            .stroke(Color(0xCBC5C5), lineWidth: 2)
                        )
                        .background(Color.white)
                        .cornerRadius(6)
                }
                
                Button(action: {
                    interactor.saveUserMessage(option: text)
                }) {
                    Image("send-button")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                }.frame(maxHeight: 20)
            }.padding()
            
            if isEnabled {
                ChoicesView(text: $text)
            }
        }.background(Color(0xF6F2F2))
    }
    
}

struct AnswerView_Previews: PreviewProvider {
    static var previews: some View {
        AnswerView(isEnabled: .constant(false))
    }
}
