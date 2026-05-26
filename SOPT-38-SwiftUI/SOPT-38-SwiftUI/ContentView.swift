//
//  ContentView.swift
//  SOPT-38-SwiftUI
//
//  Created by h2e on 5/16/26.
//

import SwiftUI

struct SampleListView: View {
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(1..<100) {
                    Text("Item \($0)")
                        .font(.title)
                }
            }
            .frame(maxWidth: .infinity)
        }
    }
}
