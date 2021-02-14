//
//  ChatView.swift
//  Ohmydate-swiftui
//
//  Created by Carlo Carpio on 2/9/21.
//

import SwiftUI

struct ChatView: View {
    @State var messageText = ""
    
    var body: some View {
        VStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 12) {
                    ForEach(MockMessages) {message in
                        MessageView(message: message)
                    }
                }
            }.padding(.top)
            
            MessageInputView(message: $messageText)
                .padding()
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}

