//
//  AnswerView.swift
//  StoryHood
//
//  Created by Kellyane Nogueira on 19/05/21.
//

import SwiftUI

struct AnswerView: View {
    @State private var text: String = ""
    @Binding var isEnabled: Bool
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                VStack {
                    TextField("", text: $text)
                }
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 6)
                    .stroke(Color(0xCBC5C5), lineWidth: 2)
                )
                .background(Color.white)
                .cornerRadius(6)
                
                Button(action: {
                   // chamar função de enviar
                }) {
                    Image("")
                    .renderingMode(.original)
                }
            }
            .padding()
            .border(Color.gray)
            
            if isEnabled {
                ChoicesView(text: $text)
            }
        }
        //.frame(width: 800, height: 490, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        .background(Color(0xF6F2F2))
    }
    
}

struct AnswerView_Previews: PreviewProvider {
    static var previews: some View {
        AnswerView(isEnabled: .constant(true))
    }
}
