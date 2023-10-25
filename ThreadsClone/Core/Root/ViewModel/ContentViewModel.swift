//
//  ContentViewModel.swift
//  ThreadsClone
//
//  Created by omar thamri on 25/10/2023.
//

import Foundation
import Combine
import Firebase

class ContentViewModel: ObservableObject {
    
    @Published var userSession: FirebaseAuth.User?
    private var cancellables = Set<AnyCancellable>()
    init() {
        setupSubscribers()
    }
    func setupSubscribers() {
        AuthService.shared.$userSession.sink { userSession in
            self.userSession = userSession
        }
        .store(in: &cancellables)
    }
}
