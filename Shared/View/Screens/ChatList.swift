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
//    @State var characters = [Personage(name: .littleRedHood, narrativeId: "littleRedRidingHood", isActive: true),
//                             Personage(name: .badWolf, narrativeId: "badWolf", isActive: false)]
    @EnvironmentObject var interactor: MessagesInteractor
    @EnvironmentObject var appState: MessageState
    
    var body: some View {
        ScrollView {
            LazyVStack(alignment: .leading) {
                ForEach(appState.characters, id: \.narrativeId) { color in
                    ZStack {
                        Circle()
                            .fill(Color.blue)
                            .onTapGesture(perform: {
                                selection = color.narrativeId!
                            })
                        Image(color.narrativeId!)
                            .resizable()
                            .clipShape(Circle())
                            .onTapGesture(perform: {
                                selection = color.narrativeId!
                            })
                        if selection == color.narrativeId {
                            //AQUI ENTRA NO CHAT ESPECIFICO
                            Circle()
                                .stroke(Color(color: selection), lineWidth: 8)
                        }
                        if color.isActive {
                            Image("onlineIcon").frame(width:16,height: 16)
                                .clipShape(Circle())
                                .offset(x: 50, y: -30)
                        } else {
                            Image("offlineIcon").frame(width:16,height: 16)
                                .clipShape(Circle())
                                .offset(x: 50, y: -30)
                        }
                    }
                    .frame(width: 80, height: 80)
                    .padding(.leading, 15)
                    .padding(.top, 15)
                }
            }
        }.padding(.top, 30)
    }
}

struct ChatList_Previews: PreviewProvider {
    
    static var previews: some View {
        NavigationView()
            .environmentObject(MessagesInteractor())
            .environmentObject(MessageState())
    }
}


//fileprivate enum Multipliers {
//    static let height: CGFloat = UIScreen.main.bounds.height/1137
//    static let width: CGFloat = UIScreen.main.bounds.width/655
//}
