//
//  CurrentWeather.swift
//  WeatherApp
//
//  Created by SOOPIN KIM on 2024-07-28.
//

import Foundation

struct CurrentWeather: Decodable{
    
    static func empty() -> CurrentWeather {
        return CurrentWeather(coord: Coordinates(lon: 0, lat: 0), weather: [], base: "", main: CurrentWeatherMain(temp: 0, feels_like: 0, temp_min: 0, temp_max: 0, pressure: 0, humidity: 0, sea_level: 0, grnd_level: 0), visibility: 0, wind: CurrentWeatherWind(speed: 0.0, deg: 0), clouds: CurrentWeatherClouds(all: 0), dt: 0, sys: CurrentWeatherSys(type: 0, id: 0, country: "Vancovuer", sunrise: 0, sunset: 0), timezone: 0, id: 0, name: "", cod: 0)
    }
    
    let coord: Coordinates
    let weather: [CurrentWeatherWeather]
    let base: String
    let main: CurrentWeatherMain
    let visibility: Int
    let wind: CurrentWeatherWind
    let clouds: CurrentWeatherClouds
    let dt: Int
    let sys: CurrentWeatherSys
    let timezone: Int
    let id: Int
    let name: String
    let cod: Int
}

struct Coordinates: Decodable {
    let lon: Double
    let lat: Double
}

struct CurrentWeatherWeather: Decodable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}

struct CurrentWeatherMain: Decodable {
    let temp: Double
    let feels_like: Double
    let temp_min: Double
    let temp_max: Double
    let pressure: Int
    let humidity: Int
    let sea_level: Int
    let grnd_level: Int
}

struct CurrentWeatherWind: Decodable {
    let speed: Double
    let deg: Int
}

struct CurrentWeatherClouds: Decodable {
    let all: Int
}

struct CurrentWeatherSys: Decodable {
    let type: Int?
    let id: Int?
    let country: String?
    let sunrise: Int?
    let sunset: Int?
}
