//
//  ThreadsTextFieldModifiers.swift
//  ThreadsClone
//
//  Created by omar thamri on 24/10/2023.
//

import SwiftUI

struct ThreadsTextFieldModifiers: ViewModifier {
    func body(content: Content) -> some View {
        content
         .font(.subheadline)
        .padding(12)
        .background(Color(.systemGray6))
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .padding(.horizontal,24)
    }
}
