//
//  ContentView.swift
//  WeatherAppSwift
//
//  Created by SOOPIN KIM on 2024-08-19.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        //        VStack(spacing: 20) {
        TabView {
            WeatherView()
                .tabItem {
                    Label("Weather", systemImage: "cloud.sun.fill")
                }
            
            LocationView()
                .tabItem {
                    Label("Location", systemImage: "magnifyingglass")
                }
        }
    }
}

#Preview {
    ContentView()
}
