//
//  LazyVGridExample.swift
//  SOPT-38-SwiftUI
//
//  Created by h2e on 5/23/26.
//

import SwiftUI

struct LazyVGridExample: View {
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 16) {
                ForEach(1...20, id: \.self) { value in
                    ZStack {
                        Rectangle()
                            .frame(width: 100,height: 100)
                            .foregroundStyle(Color.blue)
                            .cornerRadius(10)
                        
                        VStack {
                            Rectangle()
                                .frame(width: 80, height: 60)
                                .cornerRadius(10)
                                .foregroundStyle(Color.mint)
                            Text("아이템 \(value)")
                                .foregroundStyle(Color.black)
                        }
                        .padding()
                    }
                }
            }
        }
    }
}
