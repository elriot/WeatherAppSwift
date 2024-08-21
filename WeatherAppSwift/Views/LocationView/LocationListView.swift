//
//  LocationListView.swift
//  WeatherAppSwift
//
//  Created by SOOPIN KIM on 2024-08-20.
//

import SwiftUI

struct LocationListView: View {
//    let cities: [String] = ["Burnaby", "Alberta", "Busan", "Fukuoka", "Seoul"]
    let locations: [SearchLocation]
    
    var body: some View {
        VStack(spacing:30) {
            ForEach(0..<locations.count, id: \.self) { index in
                let location = locations[index]
                let name = "\(location.name) \(location.state ?? ""), \(location.country)"
                LocationListItemView(location: name)
            }
        }
    }
}

//#Preview {
//    LocationListView(locations: [])
//}
