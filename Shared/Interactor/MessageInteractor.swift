//
//  AnswerInteractor.swift
//  StoryHood
//
//  Created by Kellyane Nogueira on 19/05/21.
//

import Foundation

class MessagesInteractor: ObservableObject {

    let appState = MessageState()
    @Published var isAnswerEnabled: Bool = false
    var lastShowMessage: Int = -1

    let messages: [Message] = [Message(type: .character, text: "Oi, eu sou o Lobo Bad Lobo huhuhuh", id: 1, image: nil, isLastMessage: false),
                               Message(type: .character, text: "Oiasdasdasdqwe, eu sou o Lobo Bad Lobo huhuhuh", id: 2, image: nil, isLastMessage: true),
                               Message(type: .character, text: "ta certo entao seu mentiroso vc vai ver eu vou te pegar e vc vai virar um porquinho q constroi casa de palha e ai eu vou coisa e vc vai ver", id: 3, image: nil, isLastMessage: true)]

    var choicesText: [String] = [
                                "Você fez maravilhas, loucuras no meu coração. Um beijo para você, não posso demorar. Tô numa ligação urbana, tem mais gente pra ligar. Você fez maravilhas, loucuras no meu coração. Um beijo para você, não posso demorar. Tô numa ligação urbana, tem mais gente pra ligar",
                                "Você fez maravilhas, loucuras no meu coração. Um beijo para você, não posso demorar. Tô numa ligação urbana, tem mais gente pra ligar",
                                "Você fez maravilhas, loucuras no meu coração. Um beijo para você, não posso demorar. Tô numa ligação urbana, tem mais gente pra ligar"
                                ]

    var counter = -1

    func loadFirstMessages() {
        for (idx, message) in messages.enumerated() {
            if message.isLastMessage {
                appState.send(message: message)
                lastShowMessage = idx
                break
            }
            appState.send(message: message)
        }
    }

    func showAnswerOptions() {
        if !isAnswerEnabled {
            appState.currentOptions = choicesText
            isAnswerEnabled = true
        }
    }

    func sendMessage(option: String) {
        isAnswerEnabled = false
        let answer = Message(type: .reader, text: option, id: 5, image: nil, isLastMessage: true)
        appState.send(message: answer)
        getNextMessage()
    }

    func getNextMessage() {
        if lastShowMessage < messages.count - 1 {
            lastShowMessage += 1
            appState.onScreenMessages.append(messages[lastShowMessage])
        }
    }
    
    //Função para iniciar Choices e habilitar
}
