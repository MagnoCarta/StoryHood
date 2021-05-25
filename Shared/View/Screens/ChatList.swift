//
//  ChatList.swift
//  StoryHood
//
//  Created by Gilberto Magno on 5/19/21.
//

import Foundation
import SwiftUI

extension Color {
    init(color: String, alpha: Double = 1) {
        var r:Double = 0
        var g:Double = 0
        var b:Double = 0
        if color.contains("little") {
            r = 255
        }
        if color.contains("bad") {
            b = 255
        }
        if color.contains("trees") {
            g = 255
        }
        self.init(
            .sRGB,
            red: r/255,
            green:g/255,
            blue: b/255,
            opacity: alpha
        )
    }
}

struct ChatList: View {

    @State var selection: String = ""
    var a = [0,1,2,3]
    @State var characters = [Character(name: .littleRedRidingHood, narrativeId: "littleRedRidingHood",isActive: true),Character(name: .littleRedRidingHood, narrativeId: "badWolf",isActive: false),Character(name: .littleRedRidingHood, narrativeId: "sendButton",isActive: false),Character(name: .littleRedRidingHood, narrativeId: "treesBg",isActive: false)
    ]
    var body: some View {
        ScrollView {
            LazyVStack(alignment: .leading) {
                ForEach(characters,id:\.self) { color in
                    ZStack {
                    Circle()
                        .fill(Color.blue)
                        .frame(width: 106, height: 107)
                        .onTapGesture(perform: {
                            selection = color.narrativeId!
                            })
                        .padding(10)
                        Image(color.narrativeId!)
                            .resizable()
                            .frame(width:106,height: 107)
                            .clipShape(Circle())
                            .onTapGesture(perform: {
                                selection = color.narrativeId!
                                })
                    if selection == color.narrativeId {
                        //AQUI ENTRA NO CHAT ESPECIFICO
                        Circle()
                            .stroke(Color(color: selection), lineWidth: 8)
                            .frame(width: 110, height: 110)

                    }
                        if color.isActive {
                            Image("onlineIcon").frame(width:28,height: 28)
                                .clipShape(Circle())
                                .offset(x: 59, y: -40)
                        } else {
                            Image("offlineIcon").frame(width:28,height: 28)
                                .clipShape(Circle())
                                .offset(x: 59, y: -40)
                        }
                }
            }
            }

        }
    }

}

struct ChatList_Previews: PreviewProvider {
    
    static var previews: some View {
        ChatList()
    }
}


fileprivate enum Multipliers {
    static let height: CGFloat = UIScreen.main.bounds.height/1137
    static let width: CGFloat = UIScreen.main.bounds.width/655
}
