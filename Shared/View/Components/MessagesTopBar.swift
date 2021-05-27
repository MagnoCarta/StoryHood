//
//  MessagesTopBar.swift
//  StoryHood
//
//  Created by Tales Conrado on 20/05/21.
//

import SwiftUI

struct MessagesTopBar: View {

    @Binding var isTyping: Bool
    @EnvironmentObject var appState: MessageState

    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color(.displayP3, red: 255/255, green: 251/255, blue: 247/255, opacity: 1))
                .frame(maxHeight: 120)
                .shadow(radius: 3, y: 3)
                .ignoresSafeArea()
            HStack {
                Spacer()
                HStack {
                    if appState.characters[0].isActive {
                        Text(isTyping ? "Digitando..." : "Online")
                            .foregroundColor(.gray)
                    } else {
                        Text("Offline")
                            .foregroundColor(.gray)
                    }

                    Image(GlobalImage.littleRedRidingHood.rawValue)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxHeight: 50)
                        .clipShape(Circle(), style: /*@START_MENU_TOKEN@*/FillStyle()/*@END_MENU_TOKEN@*/)
                        .padding(.trailing, 18)
                }
            }
        }
    }
}
