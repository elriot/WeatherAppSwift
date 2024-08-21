//
//  DailyWeatherView.swift
//  WeatherAppSwift
//
//  Created by SOOPIN KIM on 2024-08-19.
//

import SwiftUI

struct DailyWeatherView: View {
    @ObservedObject var weatherVM: WeatherVM
    var body: some View {
        DailyCarouselRow(weatherVM: weatherVM)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    TopWeatherView(weatherVM: WeatherVM())
}
