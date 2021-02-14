//
//  FeedView.swift
//  Ohmydate-swiftui
//
//  Created by Carlo Carpio on 2/8/21.
//

import SwiftUI


struct FeedView: View {
    @State var isShowingNewTweetView = false
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            ScrollView {
                VStack {
                    ForEach((0..<10)) { _ in
                        TweetCell()
                    }
                }
                .padding()
            }
            
            if #available(iOS 14.0, *) {
                Button(action: {isShowingNewTweetView.toggle()}, label: {
                    Image(systemName: "plus")
                        .resizable()
                        .frame(width: 32, height: 32, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .padding()
                })
                .background(Color(.systemBlue))
                .foregroundColor(.white)
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                .padding()
                .fullScreenCover(isPresented: $isShowingNewTweetView, content: {
                    NewTweetView(isPresented: $isShowingNewTweetView)
                })
            } else {
                Button(action: {isShowingNewTweetView.toggle()}, label: {
                    Image(systemName: "plus")
                        .resizable()
                        .frame(width: 32, height: 32, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .padding()
                })
//                Button(action: {viewModel.signout()}, label: {
//                    Text("TEST")
//                })
                .background(Color(.systemBlue))
                .foregroundColor(.white)
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                .padding()
                .sheet(isPresented: $isShowingNewTweetView, content: {
                    NewTweetView(isPresented: $isShowingNewTweetView)
                })
            }
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
