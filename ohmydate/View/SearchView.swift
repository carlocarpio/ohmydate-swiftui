//
//  SearchView.swift
//  Ohmydate-swiftui
//
//  Created by Carlo Carpio on 2/9/21.
//

import SwiftUI

struct SearchView: View {
    @State var searchText = ""
    
    var body: some View {
//        if #available(iOS 14.0, *) {
//            ScrollView {
//                SearchBar(text: $searchText)
//                    .padding()
//
//                VStack(alignment: .leading) {
//                    ForEach(0..<10) { _ in
//                        HStack {
//                            Spacer()
//                        }
//                        NavigationLink(
//                            destination: UserProfileView(),
//                            label: {
//                                UserCell()
//                            })
//                    }
//                }
//                .padding(.leading)
//            }
//            .navigationTitle("Search")
//        } else {
//            ScrollView {
//                SearchBar(text: $searchText)
//                    .padding()
//
//                VStack(alignment: .leading) {
//                    ForEach(0..<10) { _ in
//                        HStack {
//                            Spacer()
//                        }
//                        NavigationLink(
//                            destination: UserProfileView(),
//                            label: {
//                                UserCell()
//                            })
//                    }
//                }
//                .padding(.leading)
//            }
//            .navigationBarTitle("Search")
//        }
        ScrollView {
            SearchBar(text: $searchText)
                .padding()
            
            VStack(alignment: .leading) {
                ForEach(0..<10) { _ in
                    HStack {
                        Spacer()
                    }
                    NavigationLink(
                        destination: UserProfileView(),
                        label: {
                            UserCell()
                        })
                }
            }
            .padding(.leading)
        }
        .navigationBarTitle("Search")
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
