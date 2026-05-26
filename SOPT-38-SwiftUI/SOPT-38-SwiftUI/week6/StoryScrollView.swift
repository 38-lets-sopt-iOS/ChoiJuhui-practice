//
//  StoryScrollView.swift
//  SOPT-38-SwiftUI
//
//  Created by h2e on 5/16/26.
//

import SwiftUI

struct StoryScrollView: View {
    let users: [ChatUser]
    @Binding var activeStates: [Bool]
    
    var body: some View {
        HStack(spacing: 0) {
            HStack(spacing: 12) {
                ForEach(Array(users.enumerated()), id: \.element.id) { index, user in
                    StoryCell(user: user, isActive: $activeStates[index])
                        .frame(maxWidth: .infinity)
                }
            }
            .padding(.horizontal, 16)
        }
    }
}

