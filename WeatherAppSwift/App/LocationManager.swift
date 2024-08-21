//
//  LocationManager.swift
//  WeatherAppSwift
//
//  Created by SOOPIN KIM on 2024-08-20.
//

import Foundation
import SwiftUI
class LocationsManager: ObservableObject {
    static let shared = LocationsManager()
    private init() {}
    
    private let defaults = UserDefaults.standard
    
    /// Selected location for our HomeVC
    @Published private var selectedLocation: SearchLocation?
    
    /// Lost of locations for our SearchVC
    @Published private var locations: [SearchLocation] = []
    
    func getSelectedLocation() -> SearchLocation? {
        if let selectedLocation {
            return selectedLocation
        } else {
            guard let data = defaults.object(forKey: "SelectedLocation") as? Data else { return nil }
            let decoder = JSONDecoder()
            do {
                let decodeData = try decoder.decode(SearchLocation.self, from: data)
                selectedLocation = decodeData
                return selectedLocation
            } catch {
               print(error)
                return nil
            }
        }
    }
    
    func getLocations() -> [SearchLocation] {
        if !locations.isEmpty {
            return locations
        } else {
            guard let data = defaults.object(forKey: "Locations") as? [Data] else {
                return []
            }
            do {
                let decoder = JSONDecoder()
                for item in data {
                    let decodedData = try decoder.decode(SearchLocation.self, from: item)
                    locations.append(decodedData)
                }
                return locations
            } catch {
                print(error)
                return []
            }
        }
    }
    
    func appendAndSave(_ location : SearchLocation){
        for item in locations {
            if item == location { return }
        }
        locations.append(location)
        saveLocations()
    }
    
    func delete(_ location: SearchLocation){
        for i in 0..<locations.count {
            guard location == locations[i] else { continue }
            locations.remove(at: i)
            saveLocations()
            return
        }
    }
    
    func saveSelected(_ location: SearchLocation){
        selectedLocation = location
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(location)
            defaults.set(data, forKey: "SelectedLocation")
        } catch {
            print(error)
        }
    }
    
    private func saveLocations(){
        do {
            var encoded: [Data] = []
            let encoder = JSONEncoder()
            for location in locations {
                let data = try encoder.encode(location)
                encoded.append(data)
            }
            defaults.set(encoded, forKey: "Locations")
        } catch {
            print(error)
        }
    }
    
    func clearSavedLocations() {
        UserDefaults.standard.removeObject(forKey: "Locations")
    }
}
