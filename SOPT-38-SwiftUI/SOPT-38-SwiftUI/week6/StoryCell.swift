//
//  StoryCell.swift
//  SOPT-38-SwiftUI
//
//  Created by h2e on 5/27/26.
//

import SwiftUI

struct StoryCell: View {
    let user: ChatUser
    @Binding var isActive: Bool
    
    var body: some View {
        VStack(spacing: 4) {
            ZStack(alignment: .bottomTrailing) {
                Image(systemName: "person.crop.circle.fill")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .foregroundStyle(isActive ? Color.blue : Color.gray)
                Circle()
                    .frame(width: 10, height: 10)
                    .foregroundStyle(isActive ? .green : .gray)
            }
            
            Text(user.name)
                .font(.caption2)
                .foregroundStyle(.black)
            
        }
    }
}
