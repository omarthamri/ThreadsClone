//
//  UserContentListViewModel.swift
//  ThreadsClone
//
//  Created by omar thamri on 30/10/2023.
//

import Foundation

class UserContentListViewModel: ObservableObject {
    
    @Published var threads = [Thread]()
    let user: User
    
    init(user: User) {
        self.user = user
        Task { try await fetchUserThreads() }
    }
    
    @MainActor
    func fetchUserThreads() async throws{
        var threadArray = try await ThreadService.fetchUserThreads(uid: user.id)
        for i in 0 ..< threadArray.count {
            threadArray[i].user = self.user
        }
        self.threads = threadArray
    }
    
    
}
