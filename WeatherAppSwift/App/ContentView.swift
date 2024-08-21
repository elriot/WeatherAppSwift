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
    private var manager: LocationsManager = LocationsManager.shared
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
            if manager.getSelectedLocation() == nil {
                showWeatherTab = false
                selectedTab = .search
            } else {
                selectedTab = .weather
                showWeatherTab = true
            }
        }
    }
}

#Preview {
    ContentView()
}
