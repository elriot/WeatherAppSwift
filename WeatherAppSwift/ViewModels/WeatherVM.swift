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
    
    init(){
        Api.shared.fetchWeather { weather in
            guard let weather = weather else { return }
            print("fetch data : \(weather)")
            DispatchQueue.main.async {
                self.setWeather(weather)
            }
        }
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
