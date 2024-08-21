//
//  LocationListItemView.swift
//  WeatherAppSwift
//
//  Created by SOOPIN KIM on 2024-08-20.
//

import SwiftUI

struct LocationListItemView: View {
    let location: SearchLocation
    let action: (SearchLocation) -> Void
    var timer = Timer()
    
    var body: some View {
        HStack {
            Spacer()
            
            Button(action: {
                action(location)
            }) {
                Text("\(location.name) \(location.state ?? ""), \(location.country)")
                    .font(.title2)
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .frame(height: 60)
            }
            
            Spacer()
        }
//        .padding(0)
//        .padding(.vertical, 0)
//        .contentShape(Rectangle())
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    LocationListItemView(
        location: SearchLocation(name: "Vancouver", lat: 0, lon: 0, country: "Canada", state: "BC"),
        action: { location in print("tap: \(location.name)") }
    )
}
