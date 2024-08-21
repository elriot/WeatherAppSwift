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
    
    func actionTap(location: SearchLocation) {
        locationVM.updateLocation(searchResult: location)
        selectedTab = .weather
        clearText()
    }
    
    var body: some View {
        VStack{
            ForEach(0..<locations.count, id: \.self) { index in
                let location = locations[index]
                LocationListItemView(location: location) { selectedLocation in
                    actionTap(location: selectedLocation)
                }
                .padding(.vertical, 0)
            }
        }
    }
}

#Preview {
    LocationListView(locations: [], clearText: { print("test")}, locationVM: LocationVM(weatherVM: WeatherVM()), selectedTab: .constant(NavPath.search))
}
