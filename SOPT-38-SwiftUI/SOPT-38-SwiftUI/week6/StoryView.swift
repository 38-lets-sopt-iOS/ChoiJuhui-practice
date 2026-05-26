//
//  StoryView.swift
//  SOPT-38-SwiftUI
//
//  Created by h2e on 5/27/26.
//

import SwiftUI

struct StoryView: View {
    @State private var activeStates: [Bool] = [true, false, false, true, false]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                StoryScrollView(
                    users: ChatUser.users,
                    activeStates: $activeStates
                )
                .padding(.vertical, 12)
                
                Divider()
                
                ChatListView(
                    users: ChatUser.users,
                    activeStates: $activeStates
                )
            }
        }
        .contentShape(Rectangle())
        .onTapGesture {
            activeStates = activeStates.map { !$0 }
        }
    }
}
