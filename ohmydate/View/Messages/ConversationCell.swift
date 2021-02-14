//
//  ConverssationCell.swift
//  Ohmydate-swiftui
//
//  Created by Carlo Carpio on 2/9/21.
//

import SwiftUI

struct ConversationCell: View {
    var body: some View {
        VStack {
            HStack(spacing: 12) {
                Image("venom-10")
                    .resizable()
                    .scaledToFill()
                    .clipped()
                    .frame(width: 56, height: 56)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                
                VStack(alignment: .leading, spacing: 4, content: {
                    Text("Venom")
                        .font(.system(size: 14, weight: .semibold))
                    
                    Text("This is a longer text for testing purposes only. We will change this to a proper text.")
                        .font(.system(size: 14))
                        .lineLimit(2)
                })
                .frame(height: 64)
                .foregroundColor(.black)
                .padding(.trailing)
            }
            Divider()
        }
    }
}

struct ConversationCell_Previews: PreviewProvider {
    static var previews: some View {
        ConversationCell()
    }
}
