//
//  CurrentUserProfileViewModel.swift
//  ThreadsClone
//
//  Created by omar thamri on 27/10/2023.
//

import Foundation
import Combine
import PhotosUI
import SwiftUI

class CurrentUserProfileViewModel: ObservableObject {
    
    @Published var currentUser: User?
    private var cancellables = Set<AnyCancellable>()
    @Published var selectedItem: PhotosPickerItem? {
        didSet {
            Task { await loadImage() }
        }
    }
    @Published var profileImage: Image?
    
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
    
    private func loadImage() async {
        guard let item = selectedItem else { return }
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiimage = UIImage(data: data) else { return }
        self.profileImage = Image(uiImage: uiimage)
    }
    
}
