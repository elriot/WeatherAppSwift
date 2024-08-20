//
//  WeatherVM.swift
//  WeatherAppSwift
//
//  Created by SOOPIN KIM on 2024-08-19.
//

import Foundation

final class WeatherVM: ObservableObject {
    @Published var currentWeather: CurrentWeather = CurrentWeather.empty()
    
    init(){
        print("init")
        Api.shared.fetchWeather { weather in
            guard let weather = weather else { return }
            print("fetch data : \(weather)")
            DispatchQueue.main.async {
                self.currentWeather = weather
            }
            print("fetch data : \(weather)")
        }
    }
}
