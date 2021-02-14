//
//  NewMessageVIew.swift
//  Ohmydate-swiftui
//
//  Created by Carlo Carpio on 2/11/21.
//

import SwiftUI

struct NewMessageView: View {
    @State var searchText = ""
    @Binding var show: Bool
    @Binding var startChat: Bool
    
    var body: some View {
        if #available(iOS 14.0, *) {
            ScrollView {
                SearchBar(text: $searchText)
                    .padding()
                
                VStack(alignment: .leading) {
                    ForEach(0..<10) { _ in
                        HStack {
                            Spacer()
                        }
                        Button(action: {
                            self.show.toggle()
                            self.startChat.toggle()
                        }, label: {
                            UserCell()
                        })
                    }
                }
                .padding(.leading)
            }
            .navigationTitle("Search")
        } else {
            // Fallback on earlier versions
        }
    }
}

struct NewMessageView_Previews: PreviewProvider {
    static var previews: some View {
        NewMessageView(show: .constant(true), startChat: .constant(true))
    }
}
