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
    private let manager: LocationsManager = LocationsManager.shared

    init(weatherVM: WeatherVM){
        self.weatherVM = weatherVM
        self.locations = manager.getLocations()
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
        manager.appendAndSave(searchResult)
        manager.saveSelected(searchResult)
        
        self.currentLocation = searchResult
        Api.shared.fetchWeather(lat: searchResult.lat, lon: searchResult.lon) { weather, forecast in
            guard let weather, let forecast else { return }
            DispatchQueue.main.async { [weak self] in
                guard let self else { return }
                weatherVM.setWeather(weather)
                weatherVM.setWeeklyForecast(forecast)
                locations = manager.getLocations()
            }
        }
    }
    
    func clearSavedLocations(){
        manager.clearSavedLocations()
        locations = []
    }
    
    func clearSavedSelectedLocations(){
        manager.clearSavedSelectedLocations()
        currentLocation = nil
    }
}
