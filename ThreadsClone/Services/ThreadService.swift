//
//  ThreadService.swift
//  ThreadsClone
//
//  Created by omar thamri on 30/10/2023.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

struct ThreadService {
    
    static func uploadThread(_ thread: Thread) async throws {
        
        guard let threadData = try? Firestore.Encoder().encode(thread) else { return }
        try await Firestore.firestore().collection("threads").addDocument(data: threadData)
    }
    
    static func fetchThreads() async throws -> [Thread] {
        
        let snapshot = try await Firestore.firestore().collection("threads").order(by: "timestamp",descending: true)
        
    }
    
    
}
