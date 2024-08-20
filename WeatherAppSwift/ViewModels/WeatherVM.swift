//
//  WeatherVM.swift
//  WeatherAppSwift
//
//  Created by SOOPIN KIM on 2024-08-19.
//

import Foundation
import SwiftUI

final class WeatherVM: ObservableObject {
    @Published var weather: CurrentWeather = CurrentWeather.empty()
    @Published var type: WeatherType? = nil
    @Published var weekly: WeeklyForecast? = nil
    
    init() {
        Api.shared.fetchWeather(lat: 49.2827, lon: -123.1216) { [weak self] weather, weekly in
            guard let self = self, let weather, let weekly else { return }
            DispatchQueue.main.async {
                self.setWeather(weather)
                self.setWeekly(weekly)
//                dump("weather : \(weather)")
//                dump("weekly : \(weekly)")
            }
        }
    }
    private func setWeekly(_ weekly: WeeklyForecast) {
        self.weekly = weekly
    }
    private func setWeather(_ weather: CurrentWeather) {
        self.weather = weather
        self.type = getWeatherType(from: weather)
    }
    
    private func getWeatherType(from weather: CurrentWeather) -> WeatherType? {
        guard let description = weather.weather.first?.main else { return nil }
        return WeatherType(description)
    }
    
    var low: Int {
        Int(weather.main.temp_min)
    }
    
    var high: Int {
        Int(weather.main.temp_max)
    }
    
    
    var icon: Image {
        if let uiImage = type?.icon {
            return uiImage
        } else {
            return Image(systemName: "questionmark")
        }
    }
    
    var tint: Color {
        return Color(type?.tint ?? Color.white)
    }
}
