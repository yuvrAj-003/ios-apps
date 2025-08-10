//
//  ContentView.swift
//  WeatherForcast
//
//  Created by YUVRAJ SINGH  on 03/08/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        
        VStack {
            
            
            Text("Weather Forcasting").font(Font.largeTitle)
            
            HStack{
                DayForcast(day: "Mon",
                        isRainy: false,
                        high: 70,
                        low: 50)
                
                DayForcast(day: "Tue",
                           isRainy: true,
                           high: 40,
                           low: 30)
                
            }
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .init(horizontal: .center, vertical: .center))
        
    }
}

#Preview {
    ContentView()
}


