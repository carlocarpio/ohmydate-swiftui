//
//  MessageInputView.swift
//  Ohmydate-swiftui
//
//  Created by Carlo Carpio on 2/9/21.
//

import SwiftUI

struct MessageInputView: View {
    
    @Binding var message: String
    
    var body: some View {
        HStack {
            TextField("Message...", text: $message)
                .textFieldStyle(PlainTextFieldStyle())
                .frame(minHeight: 30)
            Button(action: {}, label: {
                Text("Send")
            })
        }
    }
}

struct MessageInputView_Previews: PreviewProvider {
    static var previews: some View {
        MessageInputView(message: .constant("Message..."))
    }
}
