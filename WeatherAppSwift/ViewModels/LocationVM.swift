//
//  LocationVM.swift
//  WeatherAppSwift
//
//  Created by SOOPIN KIM on 2024-08-20.
//

import Foundation

final class LocationVM: ObservableObject {
    @Published var locations: [SearchLocation] = []
    
    init(){}
    
    func update(text: String){
        print(#function)
        Api.shared.fetchLocation(city: text) { locations in
            print("heerere \(text)")
            guard let locations else { return }
            DispatchQueue.main.async { [weak self] in
                guard let self else { return }
                self.locations = locations
                dump("update locations: \(locations)")
            }
        }
    }
}
