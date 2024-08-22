//
//  LocationListView.swift
//  WeatherAppSwift
//
//  Created by SOOPIN KIM on 2024-08-20.
//

import SwiftUI

struct LocationListView: View {
    let locations: [SearchLocation]
    let clearText: () -> Void
    
    @ObservedObject var locationVM: LocationVM
    @Binding var selectedTab: NavPath
    @Binding var showWeatherTab: Bool
    
    func actionTap(location: SearchLocation) {
        locationVM.updateLocation(searchResult: location)
        selectedTab = .weather
        clearText()
        showWeatherTab = true
    }
    
    var body: some View {
        List {
            ForEach(0..<locations.count, id: \.self) { index in
                let location = locations[index]
                LocationListItemView(location: location) { selectedLocation in
                    actionTap(location: selectedLocation)
                }
                .padding(.vertical, 0)
            }
            .onDelete(perform: { indexSet in
                for i in indexSet {
                    locationVM.deleteLocation(location: locations[i])
                }
//                print("delete \(indexSet)")
            })
        }
    }
}

#Preview {
    LocationListView(locations: [], clearText: { print("test")}, locationVM: LocationVM(weatherVM: WeatherVM()), selectedTab: .constant(NavPath.search), showWeatherTab: .constant(false))
}
