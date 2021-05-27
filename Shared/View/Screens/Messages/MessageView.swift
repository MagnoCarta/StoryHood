//
//  MessageView.swift
//  StoryHood
//
//  Created by Tales Conrado on 25/05/21.
//

import SwiftUI

struct MessageView: View {

    @EnvironmentObject var interactor: MessagesInteractor
    @EnvironmentObject var appState: MessageState

    var body: some View {
        VStack {
            MessagesListView()
            AnswerView()
        }.environmentObject(interactor)
        .environmentObject(appState)
        .onAppear {
            interactor.loadFirstMessages()
        }.background(Color(0xF6F2F2))
    }
}
