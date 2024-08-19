//
//  TopWeatherView.swift
//  WeatherAppSwift
//
//  Created by SOOPIN KIM on 2024-08-19.
//

import SwiftUI

struct TopWeatherView: View {
    @Binding var weather: CurrentWeather
    var low: Int {
        Int(weather.main.temp_min)
    }
    var high: Int {
        Int(weather.main.temp_max)
    }
    
    var body: some View {
        Text(weather.name)
        Text("\(Int(weather.main.temp))")
        Text(weather.weather.first?.description ?? "")
        Text("Low: \(low)° High: \(high)°")
    }
}

#Preview {
    TopWeatherView(weather: .constant(CurrentWeather.sampleData()))
}
