//
//  ContentView.swift
//  DEMO
//
//  Created by YUVRAJ SINGH  on 31/07/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Hello")
                .padding()
                .background(Color.yellow, in: RoundedRectangle(cornerRadius: 8))
                
            Text("World")
                .padding()
                .background(Color.blue, in: RoundedRectangle(cornerRadius: 8))
                .foregroundStyle(Color.white)
                .shadow(color: Color.black, radius: 2, x: 1, y: 1)
                
    
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
