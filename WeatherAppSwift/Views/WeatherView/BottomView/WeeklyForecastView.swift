//
//  WeeklyForecastView.swift
//  WeatherAppSwift
//
//  Created by SOOPIN KIM on 2024-08-20.
//

import SwiftUI
struct ForecastRow: View {
    let items: [DailyForecast]
    let types: [WeatherType]

    var body: some View {
        VStack(spacing: 10) {
            ForEach(0..<min(6, items.count), id: \.self) { index in
                let forecast = items[index]
                let type = types[index]
                let low = forecast.lows.average()
                let high = forecast.highs.average()
                let average = forecast.average
                let icon = type.icon ?? Image(systemName: "cloud.fill")
                let week = index == 0 ? "Today" : forecast.day
                WeeklyForecastDetailView(low: low, high: high, average: average, icon: icon, week: week)
            }
        }
        .background(.gray.opacity(0.1))
    }
}


struct WeeklyForecastView: View {
    @EnvironmentObject var weatherVM: WeatherVM
    var body: some View {
        if let daily = weatherVM.dailyForecast, let types = weatherVM.dailyForecastType {
            ForecastRow(items: daily, types: types)
        } else {
            Text("Loading...")
        }
    }

}

#Preview {
    WeeklyForecastView()
        .environmentObject(WeatherVM())
}
