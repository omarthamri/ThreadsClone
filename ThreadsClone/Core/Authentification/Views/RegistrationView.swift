//
//  RegistrationView.swift
//  ThreadsClone
//
//  Created by omar thamri on 24/10/2023.
//

import SwiftUI

struct RegistrationView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var fullName: String = ""
    @State private var userName: String = ""
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
                TextField("Enter your email",text: $email)
                    .textInputAutocapitalization(.none)
                    .modifier(ThreadsTextFieldModifiers())
                SecureField("Enter your password",text: $password)
                    .modifier(ThreadsTextFieldModifiers())
                TextField("Enter your fullname",text: $fullName)
                    .modifier(ThreadsTextFieldModifiers())
                TextField("Enter your username",text: $userName)
                    .modifier(ThreadsTextFieldModifiers()) 
            }
            Button {
                
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
