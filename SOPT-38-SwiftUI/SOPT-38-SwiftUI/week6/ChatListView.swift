//
//  ChatListView.swift
//  SOPT-38-SwiftUI
//
//  Created by h2e on 5/16/26.
//

import SwiftUI

struct ChatListView: View {
    let users: [ChatUser]
    @Binding var activeStates: [Bool]
    
    var body: some View {
        LazyVStack(spacing: 0) {
            ForEach(Array(users.enumerated()), id: \.element.id) { index, user in
                ChatView(user: user, isActive: $activeStates[index])
            }
        }
    }
}
