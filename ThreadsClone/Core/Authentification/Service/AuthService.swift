//
//  AuthService.swift
//  ThreadsClone
//
//  Created by omar thamri on 25/10/2023.
//

import Foundation
import Firebase

class AuthService {
    
    static let shared = AuthService()
    @Published var userSession: FirebaseAuth.User?
    
    init() {
        self.userSession = Auth.auth().currentUser
    }
    
    @MainActor
    func createUser(email: String,password: String,fullName: String,userName: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
        } catch {
            print("failed to create user \(error.localizedDescription)")
        }
    }
    
    @MainActor
    func login(email: String,password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
        } catch {
            print("failed to create user \(error.localizedDescription)")
        }
    }
    
    func signout() {
        try? Auth.auth().signOut()
        self.userSession = nil
    }
    
}
