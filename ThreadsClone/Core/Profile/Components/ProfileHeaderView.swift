//
//  ProfileHeaderView.swift
//  ThreadsClone
//
//  Created by omar thamri on 27/10/2023.
//

import SwiftUI

struct ProfileHeaderView: View {
    var user: User?
    var body: some View {
            HStack(alignment: .top) {
                VStack(alignment: .leading,spacing: 12) {
                    VStack(alignment: .leading,spacing: 4) {
                        Text(user?.fullname ?? "")
                            .font(.title2)
                            .fontWeight(.semibold)
                        Text(user?.username ?? "")
                            .font(.subheadline)
                        if let bio = user?.bio {
                            Text(bio)
                                .font(.footnote)
                        }
                        Text("2 followers")
                            .foregroundStyle(.gray)
                            .font(.caption)
                    }
                    
                }
                Spacer()
                CircularProfileImageView()
            }
        }
}

#Preview {
    ProfileHeaderView(user: .init(id: UUID().uuidString, username: "Michael Scott", email: "michael.scott@gmail.com", fullname: "Michael Scott"))
}
