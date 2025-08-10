//
//  FeatureCard.swift
//  WelcomePage
//
//  Created by YUVRAJ SINGH  on 03/08/25.
//

import SwiftUI

struct FeatureCard: View {
    
    let iconName: String;
    let description: String;
    
    var body: some View {
        
        HStack{
            
            Image(systemName: iconName)
                .font(.largeTitle)
            
            Text(description)
            
            Spacer()
            
            
        }
        .padding(10)
        .background{
            RoundedRectangle(cornerRadius: 12)
                .foregroundStyle(.tint)
                .opacity(0.25)
                .brightness(-0.4)
        }
        .foregroundStyle(.white)
        .padding(.horizontal, 20)
        
    }
}


#Preview {
    FeatureCard(iconName: "person.2.crop.square.stack.fill",
                description: "A multiline description about a feature paired with the image on the left.")
}

