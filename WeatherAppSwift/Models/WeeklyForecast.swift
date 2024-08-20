//
//  WeeklyForecast.swift
//  WeatherApp
//
//  Created by SOOPIN KIM on 2024-07-28.
//

import Foundation

struct WeeklyForecast: Decodable {
    let cod: String
    let message: Int
    let cnt: Int // list.count
    let list: [WeeklyForecastList]?
    let city: WeeklyForecastCity?
    
    func createSampleWeeklyForecast() -> WeeklyForecast {
        // City 정보
        let city = WeeklyForecastCity(
            id: 6173331,
            name: "Vancouver",
            coord: Coordinates(lon: 49.2817, lat: -123.1206),
            country: "CA",
            population: 1837969,
            timezone: -25200,
            sunrise: 1722256866,
            sunset: 1722311794
        )
        
        // 리스트 정보
        let list: [WeeklyForecastList] = [
            WeeklyForecastList(
                dt: 1722297600,
                main: WeeklyForecastListMain(
                    temp: 17.31,
                    feelsLike: 17.42,
                    tempMin: 15.82,
                    tempMax: 17.31,
                    pressure: 1012,
                    seaLevel: 1012,
                    groundLevel: 1000,
                    humidity: 89,
                    tempKf: 1.49
                ),
                weather: [
                    WeeklyForecastListWeather(id: 500, main: "Rain", description: "light rain", icon: "10d")
                ],
                clouds: WeeklyForecastListClouds(all: 100),
                wind: WeeklyForecastListWind(speed: 3.03, deg: 106, gust: 5.29),
                visibility: 10000,
                pop: 1,
                dt_txt: "2024-07-30 00:00:00"
            ),
            WeeklyForecastList(
                dt: 1722308400,
                main: WeeklyForecastListMain(
                    temp: 16.84,
                    feelsLike: 16.98,
                    tempMin: 15.9,
                    tempMax: 16.84,
                    pressure: 1012,
                    seaLevel: 1012,
                    groundLevel: 1000,
                    humidity: 92,
                    tempKf: 0.94
                ),
                weather: [
                    WeeklyForecastListWeather(id: 500, main: "Rain", description: "light rain", icon: "10d")
                ],
                clouds: WeeklyForecastListClouds(all: 100),
                wind: WeeklyForecastListWind(speed: 3.13, deg: 104, gust: 5.22),
                visibility: 10000,
                pop: 0.9,
                dt_txt: "2024-07-30 03:00:00"
            )
        ]
        
        let weeklyForecast = WeeklyForecast(
            cod: "200",
            message: 0,
            cnt: list.count,
            list: list,
            city: city
        )
        
        return weeklyForecast
    }
}

struct WeeklyForecastList: Decodable {
    let dt: Int?
    let main: WeeklyForecastListMain?
    let weather: [WeeklyForecastListWeather]?
    let clouds: WeeklyForecastListClouds?
    let wind: WeeklyForecastListWind?
    let visibility: Int?
    let pop: Double?
    let dt_txt: String?
}

struct WeeklyForecastListMain: Decodable {
    let temp: Double?
    let feelsLike: Double?
    let tempMin: Double?
    let tempMax: Double?
    let pressure: Int?
    let seaLevel: Int?
    let groundLevel: Int?
    let humidity: Int?
    let tempKf: Double?
    
    enum CodingKeys: String, CodingKey {
        case temp, pressure, humidity
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case seaLevel = "sea_level"
        case groundLevel = "grnd_level"
        case tempKf = "temp_kf"
    }
}

struct WeeklyForecastListWeather: Decodable {
    let id: Int?
    let main: String?
    let description: String?
    let icon: String?
}

struct WeeklyForecastListClouds: Decodable {
    let all: Int?
}

struct WeeklyForecastListWind: Decodable {
    let speed: Double?
    let deg: Int?
    let gust: Double?
}

struct WeeklyForecastCity: Decodable {
    let id: Int?
    let name: String?
    let coord: Coordinates?
    let country: String?
    let population: Int?
    let timezone: Int?
    let sunrise: Int?
    let sunset: Int?
}
