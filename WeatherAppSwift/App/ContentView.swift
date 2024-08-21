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
    
    init() {
        let weatherVM = WeatherVM()
        _vm = StateObject(wrappedValue: weatherVM)
        _lm = StateObject(wrappedValue: LocationVM(weatherVM: weatherVM))
    }
    
    var body: some View {
//        NavigationStack(path: $path){
            TabView(selection: $selectedTab) {
                WeatherView()
                    .tabItem {
                        Label("Weather", systemImage: "cloud.sun.fill")
                    }
                    .environmentObject(vm)
                    .tag(NavPath.weather)
                
                LocationView(selectedTab: $selectedTab)
                    .tabItem {
                        Label("Location", systemImage: "magnifyingglass")
                    }
                    .environmentObject(lm)
                    .tag(NavPath.search)
            }
//            .navigationDestination(for: NavPath.self) { path in
//                switch path {
//                case .weather:
//                    WeatherView()
//                case .search:
//                    LocationView()
//                }
//            }
//        }
    }
}

#Preview {
    ContentView()
}
