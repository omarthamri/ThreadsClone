//
//  FeedViewModel.swift
//  ThreadsClone
//
//  Created by omar thamri on 30/10/2023.
//

import Foundation

@MainActor
class FeedViewModel: ObservableObject {
    
    @Published var threads = [Thread]()
    
    init() {
        Task { try await fetchThreads() }
    }
    
    func fetchThreads() async throws {
        self.threads = try await ThreadService.fetchThreads()
        try await fetchUserDataForThreads()
    }
    
    private func fetchUserDataForThreads() async throws{
        for i in 0 ..< threads.count {
            let ownerUid = threads[i].ownerUid
            let threadUser = try await UserService.fetchUser(withuid: ownerUid)
            threads[i].user = threadUser
        }
    }
    
}
