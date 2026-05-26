//
//  ChatView.swift
//  SOPT-38-SwiftUI
//
//  Created by h2e on 5/16/26.
//

import SwiftUI

struct ChatView: View {
    let user: ChatUser
    @Binding var isActive: Bool
    
    var body: some View {
        HStack(spacing: 12) {
            ZStack(alignment: .bottomTrailing) {
                Image(systemName: "person.crop.circle.fill")
                    .resizable()
                    .frame(width: 45, height: 45)
                    .foregroundStyle(isActive ? Color.blue : Color.gray)
                Circle()
                    .frame(width: 10, height: 10)
                    .foregroundStyle(isActive ? .green : .gray)

            }
            
            VStack(alignment: .leading, spacing: 2) {
                Text(user.name).font(.body)
                Text(user.message).font(.caption).foregroundStyle(.gray)
            }
            
            Spacer()
            
            Text("오전 9:41")
                .font(.caption2)
                .foregroundStyle(.gray)
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 8)
    }
}
