//
//  DailyCarouselRowItemView.swift
//  WeatherAppSwift
//
//  Created by SOOPIN KIM on 2024-08-20.
//

import SwiftUI

struct DailyCarouselRowItemView: View {
    let icon: Image
    let hour: String
    let temp: Int
    let tint: Color
    
    var body: some View {
        VStack(spacing: 14) {
            Text(hour)
            
            icon
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)
                .foregroundColor(tint)

            
            Text("\(temp)°")
        }
        .frame(width: 70, height: 100)
        .padding()
//        .border(.gray)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    DailyCarouselRowItemView(icon: Image(systemName: "cloud.fill"), hour: "9:00 AM", temp: 26, tint: .gray)
}

