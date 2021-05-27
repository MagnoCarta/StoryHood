//
//  NavigationView.swift
//  StoryHood
//
//  Created by Gilberto Magno on 5/25/21.
//

import Foundation
import SwiftUI

//let messages: [Message] = [Message(type: .character, text: "Oi, eu sou o Lobo Bad Lobo huhuhuh", id: 1, image: nil, isLastMessage: false),
//                           Message(type: .reader, text: "Olá e eu não sou mal não", id: 2, image: nil, isLastMessage: false),
//                           Message(type: .character, text: "ta certo entao seu mentiroso vc vai ver eu vou te pegar e vc vai virar um porquinho q constroi casa de palha e ai eu vou coisa e vc vai ver", id: 3, image: nil, isLastMessage: false)]

struct NavigationView: View {
    let chatList = ChatList()
    let messageListView = MessageView()
    var body: some View {
        HStack{
            chatList
                .frame(width: 120, height: UIScreen.main.bounds.height)
            messageListView
        }
        
    }
    
}


struct Navigation_Previews: PreviewProvider {

    static var previews: some View {
        NavigationView()
    }
}

