//
//  LoginView.swift
//  ThreadsClone
//
//  Created by omar thamri on 23/10/2023.
//

import SwiftUI

struct LoginView: View {
    @StateObject private var viewModel = LoginViewModel()
    var body: some View {
        NavigationStack {
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
                }
                NavigationLink {
                    Text("Forgot pwd")
                } label: {
                    Text("Forgot password?")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity,alignment: .trailing)
                        .padding(.vertical)
                        .padding(.trailing,28)
                        .foregroundStyle(.black)
                }
                Button(action: {
                    Task { try await viewModel.login() }
                }, label: {
                    Text("Login")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .frame(width: 352,height: 44)
                        .background(.gray)
                        .foregroundStyle(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .padding(.top)
                })
                Spacer()
                Divider()
                NavigationLink {
                    RegistrationView()
                        .navigationBarBackButtonHidden()
                } label: {
                    HStack(spacing: 3) {
                        Text("Don't have an account?")
                        Text("Sign Up")
                            .fontWeight(.semibold)
                    }
                    .font(.footnote)
                    .foregroundStyle(.black)
                }
                .padding(.vertical,16)
            }
        }
    }
}

#Preview {
    LoginView()
}
