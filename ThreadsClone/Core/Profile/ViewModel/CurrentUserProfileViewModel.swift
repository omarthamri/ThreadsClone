//
//  CurrentUserProfileViewModel.swift
//  ThreadsClone
//
//  Created by omar thamri on 27/10/2023.
//

import Foundation
import Combine

class CurrentUserProfileViewModel: ObservableObject {
    
    @Published var currentUser: User?
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        setupSubscribers()
    }
    
    func signOut() {
        AuthService.shared.signout()
    }

    private func setupSubscribers() {
        UserService.shared.$currentUser.sink { [weak self] user in
            self?.currentUser = user
        }
        .store(in: &cancellables)
    }
    
}