//
//  DeveloperPreview.swift
//  ThreadsClone
//
//  Created by omar thamri on 27/10/2023.
//

import SwiftUI


extension PreviewProvider {
    static var dev: DeveloperPreview {
        return DeveloperPreview.shared
    }
}

class DeveloperPreview {
    
    static let shared = DeveloperPreview()
    
    let user = User(id: UUID().uuidString, username: "Michael Scott", email: "michael.scott@gmail.com", fullname: "Michael Scott")
}


