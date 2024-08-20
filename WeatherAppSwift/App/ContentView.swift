//
//  ContentView.swift
//  WeatherAppSwift
//
//  Created by SOOPIN KIM on 2024-08-19.
//

import SwiftUI

struct ContentView: View {
    @StateObject var vm: WeatherVM = WeatherVM()
    var body: some View {
        VStack(spacing: 20) {
            TopWeatherView()
            DailyWeatherView()
            WeeklyForecastView()
        }
    }
}

#Preview {
    ContentView()
}
