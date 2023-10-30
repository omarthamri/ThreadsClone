//
//  CreateThreadView.swift
//  ThreadsClone
//
//  Created by omar thamri on 24/10/2023.
//

import SwiftUI

struct CreateThreadView: View {
    @StateObject var viewModel = CreateThreadViewModel()
    @Environment(\.dismiss) var dismiss
    var user: User? {
        return UserService.shared.currentUser
    }
    var body: some View {
        NavigationStack {
            VStack {
                HStack(alignment: .top) {
                    CircularProfileImageView(user: user, size: .small)
                    VStack(alignment: .leading,spacing: 4) {
                        Text(user?.fullname ?? "unkonwn")
                            .fontWeight(.semibold)
                        TextField("start a thread",text: $viewModel.caption,axis: .vertical)
                    }
                    .font(.footnote)
                    Spacer()
                    if !viewModel.caption.isEmpty {
                        Button(action: {
                            viewModel.caption = ""
                        }, label: {
                            Image(systemName: "xmark")
                                .resizable()
                                .frame(width: 12, height: 12)
                                .foregroundStyle(.gray)
                        })
                    }
                }
                Spacer()
            }
            .padding()
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                    .font(.subheadline)
                    .foregroundStyle(.black)
                    }
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Post") {
                        Task {
                            try await viewModel.uploadThread()
                            dismiss()
                        }
                    }
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.black)
                    .opacity(viewModel.caption.isEmpty ? 0.5 : 1)
                    .disabled(viewModel.caption.isEmpty)
                }
            }
            .navigationTitle("New Thread")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    CreateThreadView()
}
