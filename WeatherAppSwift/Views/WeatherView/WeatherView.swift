//
//  WeatherView.swift
//  WeatherAppSwift
//
//  Created by SOOPIN KIM on 2024-08-20.
//

import SwiftUI

struct WeatherView: View {
    @StateObject var vm: WeatherVM = WeatherVM()
    var body: some View {
        VStack(spacing: 20) {
            TopWeatherView(vm: vm) // for nexttime
            DailyWeatherView()
            WeeklyForecastView()
        }
    }
}

#Preview {
    WeatherView()
}
