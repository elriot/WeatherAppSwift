//
//  DailyCarouselRow.swift
//  WeatherAppSwift
//
//  Created by SOOPIN KIM on 2024-08-19.
//

import SwiftUI
struct CarouselRow: View {
    let weekly: WeeklyForecast
    let items: [WeeklyForecastList]
    let types: [WeatherType]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing:2) {
                ForEach(0..<min(8, items.count), id: \.self) { index in
                    let image = types[index].icon ?? Image(systemName: "sun.fill")
                    let hour = items[index].dt?.toHour() ?? ":"
//                    let hour = items[index].dt_txt ?? ":"
                    let temp = Int(items[index].main?.temp ?? 0)
                    let tint = types[index].tint ?? Color.gray
                    DailyCarouselRowItemView(icon: image, hour: hour, temp: temp, tint: tint)
                }
                
            }
            .padding(.horizontal, 20)
        }
        .frame(height: 150)
        .background(.basicBackground)
    }
}
struct DailyCarouselRow: View {
    @EnvironmentObject var weatherVM: WeatherVM
    var body: some View {
        if let weekly = weatherVM.weeklyForecast, let weeklyList = weatherVM.weeklyForecastList, let types = weatherVM.dailyForecastType {
            CarouselRow(weekly: weekly, items:weeklyList, types: types)
        } else {
            Text("Loading...")
        }
    }
}

#Preview {
    DailyCarouselRow()
        .environmentObject(WeatherVM())
}
