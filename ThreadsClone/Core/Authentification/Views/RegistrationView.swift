//
//  RegistrationView.swift
//  ThreadsClone
//
//  Created by omar thamri on 24/10/2023.
//

import SwiftUI

struct RegistrationView: View {
    @StateObject private var viewModel = RegistrationViewModel()
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack {
            Spacer()
            Image("threads_logo")
                .resizable()
                .scaledToFit()
                .frame(width: 120, height: 120)
                .padding()
            VStack {
                TextField("Enter your email",text: $viewModel.email)
                    .textInputAutocapitalization(.never)
                    .modifier(ThreadsTextFieldModifiers())
                SecureField("Enter your password",text: $viewModel.password)
                    .modifier(ThreadsTextFieldModifiers())
                TextField("Enter your fullname",text: $viewModel.fullName)
                    .modifier(ThreadsTextFieldModifiers())
                TextField("Enter your username",text: $viewModel.userName)
                    .modifier(ThreadsTextFieldModifiers())
            }
            Button {
                Task { try await viewModel.createUser() }
            } label: {
                Text("Sign Up")
                    .foregroundStyle(.white)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .frame(width: 354, height: 44)
                    .background(.gray)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
            }
            .padding(.vertical)
            Spacer()
            Divider()
            Button(action: {
                dismiss()
            }, label: {
                HStack(spacing: 3) {
                    Text("Already have an account?")
                    Text("Sign In")
                        .fontWeight(.semibold)
                }
                .foregroundStyle(.black)
                .font(.footnote)
            })
            .padding(.vertical,16)
        }
    }
}

#Preview {
    RegistrationView()
}
