//
//  User.swift
//  ThreadsClone
//
//  Created by omar thamri on 25/10/2023.
//

import Foundation

struct User: Codable,Identifiable,Hashable {
    let id: String
    let username: String
    let email: String
    let fullname: String
    var profileImageUrl: String?
    var bio: String?
    
}
