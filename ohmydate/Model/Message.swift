//
//  Message.swift
//  ohmydate
//
//  Created by Carlo Carpio on 2/14/21.
//

import Foundation

struct MockMessage: Identifiable {
    let id: Int
    let imageName: String
    let messageText: String
    let isCurrentUser: Bool
}


let MockMessages: [MockMessage] = [
    .init(id: 0, imageName: "spiderman", messageText: "Hey, what's up?", isCurrentUser: false),
    .init(id: 1, imageName: "batman", messageText: "Not much, you?", isCurrentUser: true),
    .init(id: 2, imageName: "spiderman", messageText: "Cool bruh!", isCurrentUser: false),
    .init(id: 3, imageName: "batman", messageText: "Is it?", isCurrentUser: true),
    .init(id: 4, imageName: "spiderman", messageText: "Yeah, cool bruh!", isCurrentUser: false),
]
