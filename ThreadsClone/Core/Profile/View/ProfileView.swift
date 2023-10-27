//
//  ProfileView.swift
//  ThreadsClone
//
//  Created by omar thamri on 24/10/2023.
//

import SwiftUI

struct ProfileView: View {
    
    @StateObject private var viewModel = ProfileViewModel()
    let user: User
    var body: some View {
        ScrollView(showsIndicators: false) {
            // Bio and stats
            VStack(spacing: 20) {
                ProfileHeaderView(user: user)
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("Follow")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                        .frame(width: 354, height: 32)
                        .background(.black)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                })
                // user content list view
                UserContentListView()
            }
                .padding(.vertical,8)
            }
        .navigationBarTitleDisplayMode(.inline)
        .padding(.horizontal)
    }
}


#Preview {
    ProfileView(user: .init(id: UUID().uuidString, username: "Michael Scott", email: "michael.scott@gmail.com", fullname: "Michael Scott"))
}
