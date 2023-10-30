//
//  Thread.swift
//  ThreadsClone
//
//  Created by omar thamri on 29/10/2023.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

struct Thread: Codable,Identifiable {
    @DocumentID var threadId: String?
    let ownerUid: String
    let caption: String
    let timestamp: Timestamp
    var likes: Int
    var id: String {
        return threadId ?? UUID().uuidString
    }
    var user: User?
}
