//
//  Timestamp.swift
//  ThreadsClone
//
//  Created by omar thamri on 30/10/2023.
//

import Foundation
import Firebase

extension Timestamp {
    
    func timeStampString() -> String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.second,.minute,.hour,.day,.weekOfMonth]
        formatter.maximumUnitCount = 1
        formatter.unitsStyle = .abbreviated
        return formatter.string(from: self.dateValue(),to: Date()) ?? ""
    }
    
}
