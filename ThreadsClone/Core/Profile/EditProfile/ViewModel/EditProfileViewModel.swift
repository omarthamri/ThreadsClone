//
//  EditProfileViewModel.swift
//  ThreadsClone
//
//  Created by omar thamri on 28/10/2023.
//

import Foundation
import PhotosUI
import SwiftUI

class EditProfileViewModel: ObservableObject {
    
    @Published var selectedItem: PhotosPickerItem? {
        didSet {
            Task { await loadImage() }
        }
    }
    @Published var profileImage: Image?
    private var uiImage: UIImage?
    
    func updateUserData() async throws {
        try await updateProfileImage()
    }
    
    @MainActor
    private func loadImage() async {
        guard let item = selectedItem else { return }
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiimage = UIImage(data: data) else { return }
        self.profileImage = Image(uiImage: uiimage)
        self.uiImage = uiimage
    }
    
    private func updateProfileImage() async throws {
        guard let image = self.uiImage else { return }
        guard let imageUrl = try? await ImageUploader.uploadImage(image) else { return }
        try await UserService.shared.updateUserProfileImage(withImageUrl: imageUrl)
        
    }

    
}
