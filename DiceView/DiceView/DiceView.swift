//
//  DiceView.swift
//  DiceView
//
//  Created by YUVRAJ SINGH  on 03/08/25.
//

import SwiftUI

struct DiceView: View {
    
    @State private var numberOfPips: Int = 1;
    var body: some View {
        
        VStack{
            // dice
            Image(systemName: "die.face.\(numberOfPips).fill")
                .resizable()
                .frame(maxWidth: 100, maxHeight: 100)
                .aspectRatio(1, contentMode: .fit)
                .foregroundStyle(.black,.white)
            
            // roll button
            Button("roll"){
                withAnimation {
                    numberOfPips = Int.random(in: 1...6);
                }
            }
            .buttonStyle(.bordered)
            
        }
        
        
        
        
    }
}

#Preview {
    DiceView()
}
