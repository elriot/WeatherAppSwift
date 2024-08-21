//
//  ContentView.swift
//  WeatherAppSwift
//
//  Created by SOOPIN KIM on 2024-08-19.
//

import SwiftUI

struct ContentView: View {
    @StateObject var vm: WeatherVM
    @StateObject var lm: LocationVM
    
    init() {
        let weatherVM = WeatherVM()
        _vm = StateObject(wrappedValue: weatherVM)
        _lm = StateObject(wrappedValue: LocationVM(weatherVM: weatherVM))
    }
    
    var body: some View {
        TabView {
            WeatherView(weatherVM: vm)
                .tabItem {
                    Label("Weather", systemImage: "cloud.sun.fill")
                }
            
            LocationView(locationVM: lm)
                .tabItem {
                    Label("Location", systemImage: "magnifyingglass")
                }
        }
    }
}

#Preview {
    ContentView()
}
