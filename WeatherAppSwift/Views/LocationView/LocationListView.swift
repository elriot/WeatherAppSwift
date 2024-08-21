//
//  LocationListView.swift
//  WeatherAppSwift
//
//  Created by SOOPIN KIM on 2024-08-20.
//

import SwiftUI

struct LocationListView: View {
    let locations: [SearchLocation]
    @ObservedObject var locationVM: LocationVM
    
    func actionTap(location: SearchLocation) {
        locationVM.updateLocation(searchResult: location)
    }
    
    var body: some View {
        VStack{
            ForEach(0..<locations.count, id: \.self) { index in
                let location = locations[index]
                LocationListItemView(location: location) { selectedLocation in
                    actionTap(location: selectedLocation)
                }
                .padding(.vertical, 0)
//                .background(index % 2 == 0 ? .gray.opacity(0.05) : .gray.opacity(0.1))
//                .border(.gray)
            }
        }
    }
}

#Preview {
    LocationListView(locations: [], locationVM: LocationVM(weatherVM: WeatherVM()))
}
