//
//  UserContentListView.swift
//  ThreadsClone
//
//  Created by omar thamri on 27/10/2023.
//

import SwiftUI

struct UserContentListView: View {
    @StateObject var viewModel: UserContentListViewModel
    @State private var selectedFilter: ProfileThreadFilter = .threads
    @Namespace var animation
    private var filterBarWidth: CGFloat {
        var count: CGFloat = CGFloat(ProfileThreadFilter.allCases.count)
        return (UIScreen.main.bounds.width / count) - 20
    }
    
    init(user: User) {
        self._viewModel = StateObject(wrappedValue: UserContentListViewModel(user: user))
    }
    
    var body: some View {
        VStack {
            HStack {
                ForEach(ProfileThreadFilter.allCases) { filter in
                    VStack {
                        Text(filter.title)
                            .font(.subheadline)
                            .fontWeight(selectedFilter == filter ? .semibold : .regular)
                        if selectedFilter == filter {
                            Rectangle()
                                .frame(width: filterBarWidth, height: 1)
                                .foregroundStyle(.black)
                                .matchedGeometryEffect(id: "item", in: animation)
                        } else {
                            Rectangle()
                                .frame(width: filterBarWidth, height: 1)
                                .foregroundStyle(.clear)
                        }
                    }
                    .onTapGesture {
                        withAnimation(.spring) {
                            selectedFilter = filter
                        }
                    }
                    
                }
            }
            LazyVStack {
                ForEach(viewModel.threads) { thread in
                    ThreadCell(thread: thread)
                }
            }
        }
    }
}

#Preview {
    UserContentListView(user: .init(id: UUID().uuidString, username: "Michael Scott", email: "michael.scott@gmail.com", fullname: "Michael Scott"))
}
