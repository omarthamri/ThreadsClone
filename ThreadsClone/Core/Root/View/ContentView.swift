//
//  ContentView.swift
//  ThreadsClone
//
//  Created by omar thamri on 23/10/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ContentViewModel()
    var body: some View {
        Group {
            if viewModel.userSession != nil {
                ThreadsTabView()
            } else {
                LoginView()
            }
        }
        
    }
}

#Preview {
    ContentView()
}
