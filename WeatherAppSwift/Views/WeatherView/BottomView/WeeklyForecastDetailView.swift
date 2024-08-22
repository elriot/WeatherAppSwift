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
    let icon: Image
    let week: String

    init(low: Double, high: Double, average: Double, icon: Image, week: String) {
        self.low = low
        self.high = high
        self.average = average
        self.icon = icon
        self.week = week
    }
    
    var body: some View {
        HStack(spacing: 20) {
            Text(week)
                .lineLimit(1)
                .frame(width: 60, alignment: .leading)
            
            icon
                .frame(width: 30, alignment: .leading)
            
            HStack(spacing: 10){
                Text("\(Int(low))°")
                    .foregroundStyle(.secondary)
                CustomSlider(value: average, range: low...high)
                    .frame(height: 40, alignment: .center)
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
