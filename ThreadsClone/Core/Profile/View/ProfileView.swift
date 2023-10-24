//
//  ProfileView.swift
//  ThreadsClone
//
//  Created by omar thamri on 24/10/2023.
//

import SwiftUI

struct ProfileView: View {
    @State private var selectedFilter: ProfileThreadFilter = .threads
    @Namespace var animation
    private var filterBarWidth: CGFloat {
        var count: CGFloat = CGFloat(ProfileThreadFilter.allCases.count)
        return (UIScreen.main.bounds.width / count) - 20
    }
    var body: some View {
        ScrollView(showsIndicators: false) {
            // Bio and stats
            VStack(spacing: 20) {
                HStack(alignment: .top) {
                    VStack(alignment: .leading,spacing: 12) {
                        VStack(alignment: .leading,spacing: 4) {
                            Text("Dwight Schrute")
                                .font(.title2)
                                .fontWeight(.semibold)
                            Text("dwight.schrute")
                                .font(.subheadline)
                            Text("Senior salesman for dunder mufflin")
                                .font(.footnote)
                            Text("2 followers")
                                .foregroundStyle(.gray)
                                .font(.caption)
                        }
                        
                    }
                    Spacer()
                    CircularProfileImageView()
                }
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("Login")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                        .frame(width: 354, height: 32)
                        .background(.black)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                })
                // user content list view
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
                        ForEach(0..<10,id: \.self) { thread in
                          ThreadCell()
                        }
                    }
                }
                .padding(.vertical,8)
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    ProfileView()
}
