//
//  RegistrationViewModel.swift
//  ThreadsClone
//
//  Created by omar thamri on 25/10/2023.
//

import Foundation

class RegistrationViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var fullName: String = ""
    @Published var userName: String = ""
    
    @MainActor
    func createUser() async throws {
        try await AuthService.shared.createUser(email: email, password: password, fullName: fullName, userName: userName)
    }
    
    
}
