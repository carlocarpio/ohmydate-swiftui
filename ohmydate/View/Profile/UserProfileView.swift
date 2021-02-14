//
//  UserProfileView.swift
//  Ohmydate-swiftui
//
//  Created by Carlo Carpio on 2/11/21.
//

import SwiftUI

struct UserProfileView: View {
    @State var selectedFilter: TweetFilterOptions = .tweets
    
    var body: some View {
        ScrollView {
            if #available(iOS 14.0, *) {
                VStack {
                    ProfileHeaderView()
                        .padding()
                    
                    FilterButtonView(selectedOption: $selectedFilter)
                    
                    ForEach(0..<10) {tweet in
                        TweetCell()
                    }
                }
                .navigationTitle("batman")
            } else {
                VStack {
                    ProfileHeaderView()
                        .padding()
                    
                    FilterButtonView(selectedOption: $selectedFilter)
                    
                    ForEach(0..<10) {tweet in
                        TweetCell()
                    }
                }
                .navigationBarTitle("batman")
            }
        }
    }
}

struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileView()
    }
}
