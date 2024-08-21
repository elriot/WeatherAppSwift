//
//  LocationVM.swift
//  WeatherAppSwift
//
//  Created by SOOPIN KIM on 2024-08-20.
//

import Foundation

final class LocationVM: ObservableObject {
    @Published var locations: [SearchLocation] = []
    @Published var currentLocation: SearchLocation?
    
    private let weatherVM: WeatherVM

    init(weatherVM: WeatherVM){
        self.weatherVM = weatherVM
    }
    
    func update(text: String){
        Api.shared.fetchLocation(city: text) { locations in
            guard let locations else { return }
            DispatchQueue.main.async { [weak self] in
                guard let self else { return }
                self.locations = locations
            }
        }
    }
    
    func updateLocation(searchResult: SearchLocation){
        self.currentLocation = searchResult
        Api.shared.fetchWeather(lat: searchResult.lat, lon: searchResult.lon) { weather, forecast in
            guard let weather, let forecast else { return }
            DispatchQueue.main.async { [weak self] in
                guard let self else { return }
                weatherVM.setWeather(weather)
                weatherVM.setWeeklyForecast(forecast)

            }
        }
    }
}
