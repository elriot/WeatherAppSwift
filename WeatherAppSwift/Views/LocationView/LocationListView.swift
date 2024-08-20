//
//  LocationListView.swift
//  WeatherAppSwift
//
//  Created by SOOPIN KIM on 2024-08-20.
//

import SwiftUI

struct LocationListView: View {
    let cities: [String] = ["Burnaby", "Alberta", "Busan", "Fukuoka", "Seoul"]

    var body: some View {
        VStack(spacing:30) {
            ForEach(0..<cities.count, id: \.self) { index in
                let name = cities[index]
                LocationListItemView(location: name)
            }
        }
    }
}

#Preview {
    LocationListView()
}
