//
//  WelcomePage.swift
//  WelcomePage
//
//  Created by YUVRAJ SINGH  on 03/08/25.
//

import SwiftUI

struct WelcomePage: View {
    var body: some View {
        VStack{
            
            ZStack{
                RoundedRectangle(cornerRadius: 30)
                    .padding(10)
                    .frame(width: 200, height: 200)
                    .foregroundStyle(.tint)
                    .opacity(0.25)
                    .brightness(-0.4)
                
                
                Image(systemName: "figure.2.and.child.holdinghands").font(.system(size: 70))
                    .foregroundStyle(.white)
                
                
            }
                
            
            Text("Welcome to my page")
                .font(.title)
                .foregroundStyle(.white)
                .fontWeight(.bold)
                .padding(.vertical, 1)
            
            Text("Description text")
                .font(.title2)
                .foregroundStyle(.white)
                .padding(.vertical, 1)
        }
        .padding()
    }
}

#Preview {
    WelcomePage()
}
