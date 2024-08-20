//
//  LocationView.swift
//  WeatherAppSwift
//
//  Created by SOOPIN KIM on 2024-08-20.
//

import SwiftUI

struct LocationView: View {
    @State var text: String = ""
    @State private var timer: Timer?
    
    @StateObject var lm: LocationVM = LocationVM()
    
    var body: some View {
        VStack(spacing: 2) {
            LocationTextField(title: "Weather", placeholder: "Search for a city or airport", text: $text)
                .onChange(of: text) {
                    startTimer()
                }
            LocationListView()
            Spacer()
        }
    }
    
    func startTimer() {
        print("start timer")
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { _ in
            print("here")
            self.lm.update(text: self.text)
            self.timer?.invalidate() 
        }
    }
}

#Preview {
    LocationView()
}
