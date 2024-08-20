//
//  TopWeatherView.swift
//  WeatherAppSwift
//
//  Created by SOOPIN KIM on 2024-08-19.
//

import SwiftUI

struct TopWeatherView: View {
    @Binding var weather: CurrentWeather
    var low: Int {
        Int(weather.main.temp_min)
    }
    var high: Int {
        Int(weather.main.temp_max)
    }
    var type: WeatherType? {
        if let description = weather.weather.first?.main {
            print(WeatherType(description))
            return WeatherType(description)
        } else {
            return nil
        }
    }
    var icon: UIImage {
        guard let type else { return UIImage() }
        return type.icon ?? UIImage()
    }
    
    var body: some View {
        VStack {
            ZStack {
                Image(uiImage: icon)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
                    .foregroundColor(Color(type?.tint ?? .blue))
            }
            Text(weather.name)
                .padding(0.5)
            
            Text("\(Int(weather.main.temp))°")
                .padding(0.3)
                .font(.title)
                .fontWeight(.bold)
            
            Text(weather.weather.first?.description ?? "")
                .padding(0.2)
            
            HStack {
                Text("Low: \(low)°")
                Text("|")
                Text("High: \(high)°")
            }
            
        }
    }
}

#Preview {
    TopWeatherView(weather: .constant(CurrentWeather.sampleData()))
}
