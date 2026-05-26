//
//  NavigationPathPractice.swift
//  SOPT-38-SwiftUI
//
//  Created by h2e on 5/23/26.
//

import SwiftUI

struct NavigationPathPractice: View {
    let ganadi = Ganadi.friends
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            List(ganadi, id: \.self) { friend in
                Button(friend.name) {
                    path.append(friend)
                }
            }
            .navigationTitle("\(path.count)번째 view")
            
            .navigationDestination(for: Ganadi.self) { ganadi in
                EmojiView(ganadi: ganadi, path: $path)
            }
            .navigationDestination(for: String.self) { info in
                InfoView(info: info, path: $path)
            }
        }
    }
}

struct EmojiView: View {
    let ganadi: Ganadi
    @Binding var path: NavigationPath
    
    var body: some View {
        VStack {
            Text(ganadi.name)
            Text(ganadi.emoji)
            
            Button("상세 정보 보기") {
                path.append(ganadi.detail)
            }
        }
        .navigationTitle("\(path.count)번째 view")
    }
}

struct InfoView: View {
    let info: String
    @Binding var path: NavigationPath
    
    var body: some View {
        VStack {
            Text(info)
            
            Button("루트로 돌아가기") {
                path.removeLast(path.count)
            }
        }
        .navigationTitle("\(path.count)번째 view")
    }
}
