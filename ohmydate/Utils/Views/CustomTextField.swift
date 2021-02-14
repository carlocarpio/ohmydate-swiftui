//
//  CustomeTextField.swift
//  ohmydate
//
//  Created by Carlo Carpio on 2/14/21.
//

import SwiftUI

struct CustomTextField: View {
    @Binding var text: String
    let imageName: String
    let placeholder: Text
    
    var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty {
                placeholder
                    .foregroundColor(Color(.init(white: 1, alpha: 0.87)))
                    .padding(.leading, 40)
            }
            
            HStack(spacing: 16) {
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.white)
                
                TextField("", text: $text)
                    .padding(.leading, 5)
            }
            
        }
    }
}

struct CustomTextField_Previews: PreviewProvider {
    static var previews: some View {
        CustomTextField(text: .constant("123"), imageName: "envelope", placeholder: Text("Email"))
    }
}
