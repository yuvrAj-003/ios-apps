//
//  FeaturePage.swift
//  WelcomePage
//
//  Created by YUVRAJ SINGH  on 03/08/25.
//

import SwiftUI

struct FeaturePage: View {
    var body: some View {
        VStack (spacing: 10){
            Text("Features")
                .foregroundStyle(.white)
                .font(.title)
                .fontWeight(.semibold)
                .padding(.top, 30)
                .padding(.bottom, 30)
                
            
            FeatureCard(
                iconName: "person.2.crop.square.stack.fill",
                description: "A multiline description about a feature paired with the image on the left.")
            
            FeatureCard(iconName: "quote.bubble.fill", description: "Short summary")
            
            Spacer()
            
        }
        
        
    }
}

#Preview {
    FeaturePage()
}
