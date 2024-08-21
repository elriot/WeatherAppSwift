//
//  WeatherView.swift
//  WeatherAppSwift
//
//  Created by SOOPIN KIM on 2024-08-20.
//

import SwiftUI

struct WeatherView: View {
    @ObservedObject var weatherVM: WeatherVM
    
    var body: some View {
        VStack(spacing: 20) {
            TopWeatherView(weatherVM: weatherVM) // for nexttime
            DailyWeatherView()
            WeeklyForecastView()
        }
    }
}

#Preview {
    WeatherView(weatherVM: WeatherVM())
}
