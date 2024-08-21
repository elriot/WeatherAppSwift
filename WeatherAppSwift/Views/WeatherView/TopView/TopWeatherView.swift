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
        HStack(spacing: 30) {
            VStack {
                weatherIconView(icon: weatherVM.icon, tint: weatherVM.tint)
            }
//            .border(.gray)
            VStack {
                weatherInfoView
                temperatureView
                weatherDescriptionView
                temperatureRangeView(low: weatherVM.low, high: weatherVM.high)
            }
        }
        .padding()
        .background(weatherVM.tint.opacity(0.1))
        .cornerRadius(10)
        .frame(maxWidth: .infinity)
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
        Text(weatherVM.weather.name)
            .font(.headline)
            .padding(.bottom, 4)
    }
    
    private var temperatureView: some View {
        Text("\(Int(weatherVM.weather.main.temp))°")
            .font(.largeTitle)
            .fontWeight(.bold)
    }
    
    private var weatherDescriptionView: some View {
        Text(weatherVM.weather.weather.first?.description ?? "")
            .font(.subheadline)
            .padding(.bottom, 4)
    }
    
    private func temperatureRangeView(low: Int, high: Int) -> some View {
        HStack {
            Text("Low: \(low)°")
            Text("|")
            Text("High: \(high)°")
        }
        .font(.subheadline)
        .padding(.top, 4)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    TopWeatherView()
        .environmentObject(WeatherVM())
}
