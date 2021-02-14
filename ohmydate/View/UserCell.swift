//
//  UserCell.swift
//  Ohmydate-swiftui
//
//  Created by Carlo Carpio on 2/9/21.
//

import SwiftUI

struct UserCell: View {
    var body: some View {
        HStack(spacing: 12, content: {
            Image("batman")
                .renderingMode(.original)
                .resizable()
                .scaledToFill()
                .frame(width: 56, height: 56)
                .clipShape(Circle())
                

            VStack(alignment: .leading, spacing: 4, content: {
                Text("Venom")
                    .font(.system(size: 14, weight: .semibold))

                Text("Eddie Brock")
                    .font(.system(size: 14))
            })
            .foregroundColor(.black)
        })
    }
}

struct UserCell_Previews: PreviewProvider {
    static var previews: some View {
        UserCell()
    }
}
