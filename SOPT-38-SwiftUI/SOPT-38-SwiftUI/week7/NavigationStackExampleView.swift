//
//  NavigationStackExampleView.swift
//  SOPT-38-SwiftUI
//
//  Created by h2e on 5/23/26.
//

import SwiftUI

struct NavigationStackExampleView: View {
    @State private var isPresented = false
    
    var body: some View {
        NavigationStack {
            List(Ganadi.friends) { friend in
                NavigationLink(friend.name, value: friend)
            }
            .navigationDestination(for: Ganadi.self) {friend in
                DetailView(friend: friend)
            }
            .navigationTitle("듀..")
            
            NavigationLink {
                GanadiImageView()
            } label: {
                Text("이동하기 간단버전")
            }
            
            Button("이동하기 state 버전") {
                isPresented = true
            }
            .navigationDestination(isPresented: $isPresented) {
                GanadiImageView()
            }
            
        }
    }
}

struct DetailView: View {
    let friend: Ganadi
    
    var body: some View {
        Text(friend.detail)
            .navigationTitle(friend.name)
    }
}

struct GanadiImageView : View {
    let image = Image("image")
    
    var body: some View {
        image
            .resizable()
            .scaledToFit()
    }
}
