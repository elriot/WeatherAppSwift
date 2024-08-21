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
    @State private var selectedTab: NavPath = .weather
    @State private var showWeatherTab = true
    
    init() {
        let weatherVM = WeatherVM()
        _vm = StateObject(wrappedValue: weatherVM)
        _lm = StateObject(wrappedValue: LocationVM(weatherVM: weatherVM))
    }
    
    var body: some View {
        TabView(selection: $selectedTab) {
            if showWeatherTab {
                WeatherView()
                    .tabItem {
                        Label("Weather", systemImage: "cloud.sun.fill")
                    }
                    .environmentObject(vm)
                    .tag(NavPath.weather)
            }
            
            LocationView(selectedTab: $selectedTab, showWeatherTab: $showWeatherTab)
                .tabItem {
                    Label("Location", systemImage: "magnifyingglass")
                }
                .environmentObject(lm)
                .tag(NavPath.search)
        }
        .onAppear {
            if lm.locations.isEmpty {
                selectedTab = .search
                showWeatherTab = false
//                print("selected: \(selectedTab)")
            }
        }
    }
}

#Preview {
    ContentView()
}
