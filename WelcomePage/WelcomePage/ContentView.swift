//
//  ContentView.swift
//  WelcomePage
//
//  Created by YUVRAJ SINGH  on 03/08/25.
//

import SwiftUI

let gradientColors: [Color]  = [
    .gradientTop, 
    .gradientBottom
]

struct ContentView: View {
    
    
    var body: some View {
        TabView {
            WelcomePage()
            FeaturePage()
        }
        .background(Gradient(colors: gradientColors))
        .tabViewStyle(.page)
    }
}

#Preview {
    ContentView()
}
