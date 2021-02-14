//
//  TextArea.swift
//  ohmydate
//
//  Created by Carlo Carpio on 2/14/21.
//

import SwiftUI

struct TextArea: View {
    @Binding var text: String
    let placeholder: String
    
    init(_ placeholder: String, text: Binding<String>) {
        self._text = text
        self.placeholder = placeholder
        UITextView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            if text.isEmpty {
                Text(placeholder)
                    .foregroundColor(Color(.placeholderText))
                    .padding(.horizontal, 8)
                    .padding(.vertical, 12)
            }
            
            if #available(iOS 14.0, *) {
                TextEditor(text: $text)
                    .padding(4)
            } else {
                // Fallback on earlier versions
            }
        }
        .font(.body)
    }
}


