//
//  ContentView.swift
//  DiceView
//
//  Created by YUVRAJ SINGH  on 03/08/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var numOfDices = 2
    var body: some View {
        VStack {
            
            Text("Dice Roller")
                .font(.largeTitle.lowercaseSmallCaps())
                .foregroundStyle(.white)
            
            // no of dices
            HStack{
                
                ForEach(1...numOfDices, id: \.description) {
                    _ in DiceView()
                }
            }
            
            // add remove dice
            HStack{
                Button ("Remove Dice" , systemImage:"minus.circle.fill"){
                    
                    withAnimation {
                        numOfDices -= 1
                    }
                    
                    
                }.disabled(numOfDices == 1)
                    .foregroundStyle(.gray)
                
                
                Button ("Add Dice", systemImage:"plus.circle.fill"){
                    
                    withAnimation {
                        numOfDices += 1
                    }
                    
                }.disabled(numOfDices == 6)
                    .foregroundStyle(.white)
            }
            .padding()
            .labelStyle(.iconOnly)
            .font(.title)
            
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.appBackground)
        .tint(.white)
    }
}

#Preview {
    ContentView()
}
