//
//  TopWeatherView.swift
//  WeatherAppSwift
//
//  Created by SOOPIN KIM on 2024-08-19.
//

import SwiftUI

struct TopWeatherView: View {
    @EnvironmentObject var weatherVM: WeatherVM
    
    var body: some View {
        if weatherVM.weather != nil {
            HStack(spacing: 30) {
                VStack {
                    weatherIconView(icon: weatherVM.icon, tint: weatherVM.tint)
                }
    //            .border(.gray)
                VStack {
                    weatherInfoView
                    temperatureView
                    weatherDescriptionView
                    temperatureRangeView
                }
            }
            .padding()
            .background(weatherVM.tint.opacity(0.1))
            .cornerRadius(10)
            .frame(maxWidth: .infinity)
        }
    }
        
    
    private func weatherIconView(icon: Image, tint: Color) -> some View {
        ZStack {
            icon
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
                .foregroundColor(tint)
        }
    }
    
    private var weatherInfoView: some View {
        Text(weatherVM.weather?.name ?? "")
    }
    
    private var temperatureView: some View {
        Text("\(Int(weatherVM.weather?.main.temp ?? 0))°")
            .font(.largeTitle)
            .fontWeight(.bold)
    }
    
    private var weatherDescriptionView: some View {
        Text(weatherVM.weather?.weather.first?.description ?? "")
            .font(.subheadline)
            .padding(.bottom, 4)
    }
    
    private var temperatureRangeView: some View {

        HStack {
            if weatherVM.weather != nil {
                Text("Low: \(weatherVM.low)°")
                Text("|")
                Text("High: \(weatherVM.high)°")
            }
        }
        .font(.subheadline)
        .padding(.top, 4)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    TopWeatherView()
        .environmentObject(WeatherVM())
}
