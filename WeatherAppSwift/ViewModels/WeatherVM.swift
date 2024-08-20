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
    @Published var weeklyForecast: WeeklyForecast? = nil
    @Published var dailyForecast: [DailyForecast]? = []
    @Published var dailyForecastType: [WeatherType]? = []
    @Published var weeklyForecastList: [WeeklyForecastList]? = []
    
    init() {
//        Api.shared.fetchSample(CurrentWeather.self) { [weak self] data in
//            guard let self, let data else { return }
//            DispatchQueue.main.async {
//                self.setWeather(data)
////                self.setWeekly(weekly)
////                self.setDailyForecast(data)
//            }
//        }
//        Api.shared.fetchSample(WeeklyForecast.self) { [weak self] data in
//            guard let self, let data else { return }
//            DispatchQueue.main.async {
//                self.setWeeklyForecast(data)
//            }
//        }
        Api.shared.fetchWeather(lat: 49.2827, lon: -123.1216) { [weak self] weather, weekly in
            guard let self = self, let weather, let weekly else { return }
            DispatchQueue.main.async {
                self.setWeather(weather)
                self.setWeeklyForecast(weekly)
//                self.setDailyForecast(weekly)
            }
        }
//        Api.shared.fetchSample(WeeklyForecast) { [weak self] weekly in
//            guard let self, let weekly else { return }
//            
//        }
    }
    private func setWeeklyForecast(_ weekly: WeeklyForecast) {
        self.weeklyForecast = weekly
        guard let list = weekly.list else { return }
        weeklyForecastList = list
        self.setDailyForecast(list)
    }
    private func setWeather(_ weather: CurrentWeather) {
        self.weather = weather
        self.type = getWeatherType(from: weather)
    }
    private func setDailyForecast(_ list: [WeeklyForecastList]) {
        let dailyList = list.getDailyForecasts()
        dailyForecast = dailyList
        dailyForecastType = getDailyForecastType(from: list)
    }
    
    private func getWeatherType(from weather: CurrentWeather) -> WeatherType? {
        guard let description = weather.weather.first?.main else { return nil }
        return WeatherType(description)
    }
    
//    private func getWeeklyForecastType(from: list: [WeeklyForecastList]) -> WeatherType
    
    private func getDailyForecastType(from daily: [WeeklyForecastList]) -> [WeatherType] {
        var list: [WeatherType] = []

        daily.forEach { forecast in
            let weatherType = WeatherType(forecast.weather?.first?.main ?? "")
            list.append(weatherType)
        }

        return list
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
