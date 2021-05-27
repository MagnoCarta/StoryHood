//
//  AnswerView.swift
//  StoryHood
//
//  Created by Kellyane Nogueira on 19/05/21.
//

import SwiftUI

struct AnswerView: View {
    @State private var text: String = ""
    @EnvironmentObject var interactor: MessagesInteractor

    var body: some View {
        Spacer()
        VStack {
            HStack {
                if !interactor.isAnswerEnabled {
                    Text("Escreva sua mensagem")
                        .foregroundColor(.secondary)
                        .lineLimit(1)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 17)
                            .stroke(Color(0xCBC5C5), lineWidth: 2)
                        )
                        .background(Color.white)
                        .cornerRadius(17)
                        .onTapGesture {
                            #if os(iOS)
                            let feedback = UINotificationFeedbackGenerator()
                            feedback.notificationOccurred(.error)
                            #endif
                        }
                    
                } else {
                    Text(text) //Or TextEditor(text: $text)
                        .lineLimit(3)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 6)
                            .stroke(Color(0xCBC5C5), lineWidth: 2)
                        )
                        .background(Color.white)
                        .cornerRadius(6)
                }
                Button(action: {
                    interactor.sendMessage()
                    text = ""
                }) {
                    Image("sendButton")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxHeight: 30)
                }
            }.padding()
            
            if interactor.isAnswerEnabled {
                ChoicesView(text: $text)
            }
        }.background(Color(0xF6F2F2))
    }
    
}

struct AnswerView_Previews: PreviewProvider {

    static var previews: some View {
        NavigationView()
            .environmentObject(MessagesInteractor())
            .environmentObject(MessageState())
    }
}
