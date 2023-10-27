//
//  CurrentUserProfile.swift
//  ThreadsClone
//
//  Created by omar thamri on 27/10/2023.
//

import SwiftUI

struct CurrentUserProfileView: View {
    @StateObject private var viewModel = CurrentUserProfileViewModel()
    private var currentUser: User? {
        return viewModel.currentUser
    }
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                // Bio and stats
                VStack(spacing: 20) {
                        ProfileHeaderView(user: currentUser)
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Text("Edit profile")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundStyle(.black)
                            .frame(width: 354, height: 32)
                            .background(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                            .overlay {
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color(.systemGray4),lineWidth: 1)
                            }
                    })
                    // user content list view
                    UserContentListView()
                    .padding(.vertical,8)
                }
            }
            .padding(.horizontal)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        viewModel.signOut()
                    } label: {
                        Image(systemName: "line.3.horizontal")
                    }

                    
                }
            }
        }
    }
}

#Preview {
    CurrentUserProfileView()
}
