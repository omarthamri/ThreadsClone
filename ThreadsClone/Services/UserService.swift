//
//  UserService.swift
//  ThreadsClone
//
//  Created by omar thamri on 26/10/2023.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

class UserService {
    
    @Published var currentUser: User?
    static let shared = UserService()
    
    init() {
        Task { try await fetchCurrentUser() }
    }
    
    @MainActor
    func fetchCurrentUser() async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let snapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
        self.currentUser = try snapshot.data(as: User.self)
    }
    
}
