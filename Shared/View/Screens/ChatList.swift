//
//  ChatList.swift
//  StoryHood
//
//  Created by Gilberto Magno on 5/19/21.
//

import Foundation
import SwiftUI

extension Color {
    init(hex: UInt, alpha: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: alpha
        )
    }
}

struct ChatList: View {
    @State var selection: String = ""
    var a = [0,1,2,3]
    var characters = [Character(name: .littleRedHood, narrativeId: "red",isActive: false),Character(name: .littleRedHood, narrativeId: "blue",isActive: false),Character(name: .littleRedHood, narrativeId: "black",isActive: false),Character(name: .littleRedHood, narrativeId: "green",isActive: false)
    ]
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(characters,id:\.self) { color in
                    ZStack {
                    Circle()
                        .fill(Color.blue)
                        .frame(width: 50, height: 50)
                        .onTapGesture(perform: {
                            selection = color.narrativeId!
                            })
                        .padding(10)

                    if selection == color.narrativeId {
                        //AQUI ENTRA NO CHAT ESPECIFICO
                        Circle()
                            .stroke(Color.red, lineWidth: 5)
                            .frame(width: 60, height: 60)

                    }
                }
            }
            }.position(x: 60, y: 300)
        }
    }

}


struct CircleView: View {
    var size: CGSize
    var color: Color
    var body: some View {
        Circle()
            .foregroundColor(color)
    }
}


struct ChatList_Previews: PreviewProvider {
    
    static var previews: some View {
        ChatList()
    }
}




