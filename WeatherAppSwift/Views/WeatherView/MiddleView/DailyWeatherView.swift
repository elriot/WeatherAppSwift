//
//  DailyWeatherView.swift
//  WeatherAppSwift
//
//  Created by SOOPIN KIM on 2024-08-19.
//

import SwiftUI

struct DailyWeatherView: View {
//    @EnvironmentObject var weatherVM: WeatherVM
    var body: some View {
        DailyCarouselRow()
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    TopWeatherView()
        .environmentObject(WeatherVM())
}
