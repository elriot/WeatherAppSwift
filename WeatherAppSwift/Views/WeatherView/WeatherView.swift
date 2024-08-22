//
//  WeatherView.swift
//  WeatherAppSwift
//
//  Created by SOOPIN KIM on 2024-08-20.
//

import SwiftUI

struct WeatherView: View {
    @EnvironmentObject var weatherVM: WeatherVM
    
    var body: some View {
        VStack(spacing: 20) {
            TopWeatherView()
                .cornerRadius(10)
            DailyWeatherView()
                .cornerRadius(10)
            WeeklyForecastView()
                .cornerRadius(10)
        }
        .padding()
    }
}

#Preview {
    WeatherView()
        .environmentObject(WeatherVM())
}
