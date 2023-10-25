//
//  LoginViewModel.swift
//  ThreadsClone
//
//  Created by omar thamri on 25/10/2023.
//

import Foundation

class LoginViewModel: ObservableObject {
    
    @Published var email: String = ""
    @Published var password: String = ""
    
    @MainActor
    func login() async throws {
        try await AuthService.shared.login(email: email, password: password)
    }
    
}
