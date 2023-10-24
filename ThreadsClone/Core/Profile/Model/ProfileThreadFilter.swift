//
//  ProfileThreadFilter.swift
//  ThreadsClone
//
//  Created by omar thamri on 24/10/2023.
//

import Foundation

enum ProfileThreadFilter: Int,CaseIterable,Identifiable {
    
    case threads
    case replies
    var title: String {
        switch self {
        case .threads: return "Threads"
        case .replies: return "Replies"
        }
    }
    var id: Int { return self.rawValue }
}
