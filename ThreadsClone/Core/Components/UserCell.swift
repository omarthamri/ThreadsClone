//
//  UserCell.swift
//  ThreadsClone
//
//  Created by omar thamri on 24/10/2023.
//

import SwiftUI

struct UserCell: View {
    var body: some View {
        HStack {
            CircularProfileImageView()
            VStack {
                Text("Dwight schrute")
                    .fontWeight(.semibold)
                Text("Senior salesman")
            }
            .font(.footnote)
            Spacer()
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Text("Follow")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.black)
                    .frame(width: 100, height: 32)
                    .overlay {
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color(.systemGray4),lineWidth: 1)
                    }
            })
        }
        .padding(.horizontal)
    }
}

#Preview {
    UserCell()
}
