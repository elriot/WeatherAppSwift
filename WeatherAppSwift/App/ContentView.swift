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
    @State private var path: [NavPath] = [] 
    
    init() {
        let weatherVM = WeatherVM()
        _vm = StateObject(wrappedValue: weatherVM)
        _lm = StateObject(wrappedValue: LocationVM(weatherVM: weatherVM))
    }
    
    var body: some View {
        NavigationStack(path: $path){
            TabView {
                WeatherView()
                    .tabItem {
                        Label("Weather", systemImage: "cloud.sun.fill")
                    }
                    .environmentObject(vm)
                
                LocationView()
                    .tabItem {
                        Label("Location", systemImage: "magnifyingglass")
                    }
                    .environmentObject(lm)
            }
            .navigationDestination(for: NavPath.self) { path in
                switch path {
                case .weather:
                    WeatherView()
                case .search:
                    LocationView()
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
