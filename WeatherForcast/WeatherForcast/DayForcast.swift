//
//  DayForcast.swift
//  WeatherForcast
//
//  Created by YUVRAJ SINGH  on 03/08/25.
//

import SwiftUI

struct DayForcast: View {
    let day: String;
    let isRainy: Bool;
    let high: Int;
    let low: Int;
    

    
    var iconName: String {
        isRainy ? "cloud.rain.fill" : "sun.max.fill";
    }
    
    var iconColor: Color {
        isRainy ? Color.blue : Color.yellow;
    }
    
    var body: some View {
        VStack {
            
            Text(day)
                .font(Font.largeTitle)
            
            Image(systemName: iconName)
                .resizable()
                .frame(width: 30, height: 30)
                .foregroundStyle(iconColor)
                .padding(5)
            
            Text("High: \(high)°").fontWeight(Font.Weight.semibold)
            Text("Low: \(low)°").fontWeight(Font.Weight.semibold)
        }
        .padding()
    }
}

