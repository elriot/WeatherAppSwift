//
//  LocationListItemView.swift
//  WeatherAppSwift
//
//  Created by SOOPIN KIM on 2024-08-20.
//

import SwiftUI

struct LocationListItemView: View {
    let location: String
    let lm = LocationsManager.shared
    var timer = Timer()
    var updatedString: String = ""
    
    var body: some View {
        Button(location) {
            print("tap : \(location)")
        }
        .font(.title3)
        .foregroundColor(.black)
    }
}

#Preview {
    LocationListItemView(location: "Vancouver, Canada")
}
