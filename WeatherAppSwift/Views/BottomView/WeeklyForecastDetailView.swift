//
//  WeeklyForecastDetailView.swift
//  WeatherAppSwift
//
//  Created by SOOPIN KIM on 2024-08-20.
//

import SwiftUI


struct WeeklyForecastDetailView: View {
    let low: Double
    let high: Double
    let average: Double
    @State var value: Double
    let icon: Image
    let week: String

    init(low: Double, high: Double, average: Double, icon: Image, week: String) {
        self.low = low
        self.high = high
        self.average = average
        _value = State(initialValue: average)  // Initialize the slider
        self.icon = icon
        self.week = week
    }
    
    var body: some View {
        HStack(spacing: 20) {
            Text(week)
                .lineLimit(1)
                .frame(width: 60, alignment: .leading)
//                .border(.gray)
            
            icon
                .frame(width: 30, alignment: .leading)
//                .border(.gray)
            
            HStack(spacing: 10){
                Text("\(Int(low))°")
                    .foregroundStyle(.secondary)
                Slider(value: $value, in: Double(low)...Double(high))
                Text("\(Int(high))°")
            }
        }
        .padding(.horizontal)
        .frame(height: 40)
    }
}


#Preview {
    WeeklyForecastDetailView(low: 18.02, high: 28.29, average: 19.12, icon: Image(systemName: "cloud.fill"), week: "Mon")
}
