//
//  ProfileViewModel.swift
//  ThreadsClone
//
//  Created by omar thamri on 25/10/2023.
//

import Foundation

class ProfileViewModel: ObservableObject {
    
    func signOut() {
        AuthService.shared.signout()
    }

    
}
